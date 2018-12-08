#include <iostream>
using namespace std;

int main() {
  string from = "echo FROM: $USER@`hostname`; ";
  string subject = "echo \"SUBJECT: This is only a test\"; echo; ";
  string body = "echo \"Here is the body\";) ";
  string exec = "| curl smtp://146.169.46.139 --mail-rcpt dhg18mail@localhost -T -";
  string cmd = from + subject + body + exec;

  system(cmd.c_str());

  return 0;
}
