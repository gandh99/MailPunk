#include <iostream>
using namespace std;

int main() {
  string user = "USER=dhg18mail ";
  string server = "SERVER=146.169.46.139 ";
  string password = "PASSWORD=WhOhkeN6sUtNk ";
  string executable = "./MailPunk";
  string cmd = user + server+ password + executable;

  system(cmd.c_str());
  
  return 0;
}
