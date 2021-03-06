#include <iostream>
#include <string>
#include <time.h>

#include "../dcomh.hpp"

#if defined(__linux__) && defined(LOG_VOLUME_INSTALLED)
#define LOG_VOLUME "/media/nvidia/AXOLOTLDCV"
#else
#define LOG_VOLUME axolotlFileSystem::getHomeDir()
#endif

using namespace std;

std::string createTimestamp() {
  string dirPrefix = "/axolotl/data/axolotl_log_", dirBase = LOG_VOLUME, dirName = dirBase + dirPrefix;

  time_t raw_time = time(NULL);
  struct tm *processed_time = localtime(&raw_time);
  string startYear = to_string(processed_time->tm_year+1900);
  string startMonth = to_string(processed_time->tm_mon+1);
  string startDay = to_string(processed_time->tm_mday);

  int startSecProcessed = processed_time->tm_sec;
  string startSec = to_string(startSecProcessed);
  if(startSecProcessed < 10) {
    startSec = "0" + startSec;    // ensures that seconds are always 2 digits
  }

  int startMinProcessed = processed_time->tm_min;
  string startMin = to_string(startMinProcessed);
  if(startMinProcessed < 10) {
    startMin = "0" + startMin;    // ensures that minutes are always 2 digits
  }

  int startHourProcessed = processed_time->tm_hour;
  string startHour = "" + to_string(startHourProcessed);
  if(startHourProcessed < 10) {
    startHour = "0" + startHour;    // ensures that hours are always 2 digits
  }

  // Assemble path
  dirName = dirName + startYear + "_" + startMonth + "_" + startDay + "_" + startHour + startMin + startSec;
  return dirName;
}

int main() {
  time_t raw_time;
  time (&raw_time);

  struct tm *time_sample = localtime(&raw_time);
  std::string timestamp = asctime(time_sample);

  timestamp.pop_back();
  std::cout << timestamp << "...." << std::endl;

  struct stat buffer;
  bool is_dir = ((stat("/Users/VictorLi/axolotl/", &buffer) == 0) && S_ISDIR(buffer.st_mode));
  std::cout << is_dir << std::endl;

  std::string echo_string = "echo \"" + to_string(1) + "\n" + to_string(2) + "\n" + to_string(3) + "\" > ~/axolotl/angles";
  std::cout << echo_string << std::endl;
  system(echo_string.c_str());

  double calibrated_angle[3] = {0.0, 0.0, 0.0};
  std::string angle_file = string(getenv("HOME")) + "/axolotl/angles", c_angle;
  std::ifstream angles_in;
  angles_in.open(angle_file.c_str());
  if(angles_in.is_open()) {
    getline(angles_in,c_angle);
    calibrated_angle[0] = atof(c_angle.c_str());
    getline(angles_in,c_angle);
    calibrated_angle[1] = atof(c_angle.c_str());
    getline(angles_in,c_angle);
    calibrated_angle[2] = atof(c_angle.c_str());
    angles_in.close();
  }

  std::cout << calibrated_angle[2] << std::endl;

  return 0;

}
