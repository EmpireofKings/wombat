/*--------------------------------------------------------------------
******************************************************************************
* @file comms.cpp
* @author Isaac Jesus da Silva - ROBOFEI-HT - FEI
* @version V0.0.2
* @created 15/05/2014
* @Modified 24/08/2015
* @e-mail isaac25silva@yahoo.com.br
* @brief comms
****************************************************************************/
/**
 *
 *  \file
 *  \brief      Implementation of Comms class methods to handle reading and
 *              writing to the UM6 serial interface.
 *  \author     Mike Purvis <mpurvis@clearpathrobotics.com>
 *  \copyright  Copyright (c) 2013, Clearpath Robotics, Inc.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of Clearpath Robotics, Inc. nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL CLEARPATH ROBOTICS, INC. BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Please send comments, questions, or patches to code@clearpathrobotics.com
 *
 */

#include "um6/comms.h"
#include <iostream>
#include <arpa/inet.h>
#include <boost/algorithm/string/predicate.hpp>
#include <boost/foreach.hpp>
#include <string>

#include "../serial/include/serial.h"
#include "registers.h"

//using namespace serial;

namespace um6
{

const uint8_t Comms::PACKET_HAS_DATA = 1 << 7;
const uint8_t Comms::PACKET_IS_BATCH = 1 << 6;
const uint8_t Comms::PACKET_BATCH_LENGTH_MASK = 0x0F;
const uint8_t Comms::PACKET_BATCH_LENGTH_OFFSET = 2;

int16_t Comms::receive(Registers* registers = NULL)
{
  // Search the serial stream for a start-of-packet sequence.
  try
  {
    //size_t available = serial_->available();
    size_t available = serial_->available();
    if (available > 255)
    {
      std::cout << "Serial read buffer is " << available << ", now flushing in an attempt to catch up." << std::endl;
      serial_->flushInput();
    }

    // Optimistically assume that the next five bytes on the wire are a packet header.
    uint8_t header_bytes[5];
    serial_->read(header_bytes, 5);

    uint8_t type, address;
    if (memcmp(header_bytes, "snp", 3) == 0)
    {
      // Optimism win.
      type = header_bytes[3];
      address = header_bytes[4];
    }
    else
    {
      // Optimism fail. Search the serial stream for a header.
      std::string snp;
      serial_->readline(snp, 96, "snp");
      if (!boost::algorithm::ends_with(snp, "snp")) throw SerialTimeout();
      if (snp.length() > 3)
      {
        if (!first_spin_) {
            std::cout << "Discarded " << 5 + snp.length() - 3 << " junk byte(s) preceeding packet." << std::endl;
        }
      }
      if (serial_->read(&type, 1) != 1) throw SerialTimeout();
      if (serial_->read(&address, 1) != 1) throw SerialTimeout();
    }

    first_spin_ = false;

    uint16_t checksum_calculated = 's' + 'n' + 'p' + type + address;
    std::string data;
    if (type & PACKET_HAS_DATA)
    {
      uint8_t data_length = 1;
      if (type & PACKET_IS_BATCH)
      {
        data_length = (type >> PACKET_BATCH_LENGTH_OFFSET) & PACKET_BATCH_LENGTH_MASK;
        //std::cout << "Received packet " << address << " with batched " << data_length << " data." << std::endl;
      }
      else
      {
        //std::cout << "Received packet " << address << " with non-batched data." << std::endl;
      }

      // Read data bytes initially into a buffer so that we can compute the checksum.
      if (serial_->read(data, data_length * 4) != data_length * 4) throw SerialTimeout();
      BOOST_FOREACH(uint8_t ch, data)
      {
        checksum_calculated += ch;
      }
    }
    else
    {
      std::cout << "Received packet " << address << " without data." << std::endl;
    }

    // Compare computed checksum with transmitted value.
    uint16_t checksum_transmitted;
    if (serial_->read(reinterpret_cast<uint8_t*>(&checksum_transmitted), 2) != 2)
    {
      throw SerialTimeout();
    }
    checksum_transmitted = ntohs(checksum_transmitted);
    if (checksum_transmitted != checksum_calculated)
    {
      throw BadChecksum();
    }

    // Copy data from checksum buffer into registers, if specified.
    // Note that byte-order correction (as necessary) happens at access-time.
    if ((data.length() > 0) && registers)
    {
      registers->write_raw(address, data);
    }

    // Successful packet read, return address byte.
    return address;
  }
  catch(const SerialTimeout& e)
  {
    std::cout << "Timed out waiting for packet from device." << std::endl;
  }
  catch(const BadChecksum& e)
  {
    std::cout << "Discarding packet due to bad checksum." << std::endl;
  }
  return -1;
}

std::string Comms::checksum(const std::string& s)
{
  uint16_t checksum = 0;
  BOOST_FOREACH(uint8_t ch, s)
  {
    checksum += ch;
  }
  checksum = htons(checksum);
  std::cout << "Computed checksum on string of length " << s.length() << " as " << checksum << std::endl;
  std::string out(2, 0);
  memcpy(&out[0], &checksum, 2);
  return out;
}

std::string Comms::message(uint8_t address, std::string data)
{
  uint8_t type = 0;
  if (data.length() > 0)
  {
    type |= PACKET_HAS_DATA;
  }
  if (data.length() > 4)
  {
    type |= PACKET_IS_BATCH;
    type |= (data.length() / 4) << PACKET_BATCH_LENGTH_OFFSET;
  }

  std::stringstream ss(std::stringstream::out | std::stringstream::binary);
  ss << "snp" << type << address << data;
  std::string output = ss.str();
  std::string c = checksum(output);
  ss << c;
  output = ss.str();
  std::cout << "Generated message " << address << " of overall length " << output.length() << std::endl;
  return output;
}

void Comms::send(const Accessor_& r) const
{
  uint8_t address = r.index;
  std::string data(reinterpret_cast<char*>(r.raw()), r.length * 4);
  serial_->write(message(r.index, data));
}

bool Comms::sendWaitAck(const Accessor_& r)
{
  const uint8_t tries = 5;
  for (uint8_t t = 0; t < tries; t++)
  {
    send(r);
    const uint8_t listens = 20;
    for (uint8_t i = 0; i < listens; i++)
    {
      int16_t received = receive();
      if (received == r.index)
      {
        std::cout << "Message " << received << " ack received." << std::endl;
        return true;
      }
      else if (received == -1)
      {
        std::cout << "Serial read timed out waiting for ack. Attempting to retransmit." << std::endl;
        break;
      }
    }
  }
  return false;
}
}  // namespace um6