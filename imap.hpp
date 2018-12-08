#ifndef IMAP_H
#define IMAP_H
#include "imaputils.hpp"
#include <libetpan/libetpan.h>
#include <iostream>
#include <string>
#include <cstring>
#include <fstream>
#include <vector>
#include <functional>

#define ERROR_MSG_PREFIX "The following error has occurred: "

namespace IMAP {
  class Session;
  class Message;

class Message {
private:
  uint32_t uid;
  mailimap *session;
  char *rfc_header;
  std::function<void()> msg_function;
  
public:
  Message(uint32_t uid, mailimap *session, std::function<void()> msg_function);

  //Get the body of the message
  std::string getBody();

  //Helper functions for getBody()
  char* get_msg_content(clist *fetch_result, size_t *p_msg_size);
  char* get_msg_att_msg_content(mailimap_msg_att *msg_att, size_t *p_msg_size);

  //Get one of the descriptor fields (subject, from, ...)
  std::string getField(std::string fieldname);
  
  //Remove this mail from its mailbox
  void deleteFromMailbox();
};

class Session {
private:
  mailimap *session;
  Message **message_array;
  std::function<void()> session_function;
  
public:
  Session(std::function<void()> updateUI);  
  
  //Get all messages in the INBOX mailbox terminated by a nullptr (like we did in class)
  Message** getMessages();

  //Get the uid of the messages
  static uint32_t get_uid(mailimap_msg_att * msg_att);

  //connect to the specified server (143 is the standard unencrypted imap port)
  void connect(std::string const& server, size_t port = 143);

  //log in to the server (connect first, then log in)
  void login(std::string const& userid, std::string const& password);

  //select a mailbox (only one can be selected at any given time). this can only be performed after login
  void selectMailbox(std::string const& mailbox);

  ~Session();
};
}

#endif /* IMAP_H */
