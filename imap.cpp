#include "imap.hpp"
using namespace std;
using namespace IMAP;

//Message constructor. Each message will have a unique uid and rfc_header, as well as a common session
Message::Message(uint32_t uid, mailimap *session, function<void()> msg_function) : uid(uid), session(session), msg_function(msg_function) {
}

//Get the message body
string Message::getBody() {
  size_t msg_len;
  char *msg_content;
  clist *fetch_result;
  
  mailimap_set *set = mailimap_set_new_single(uid);
  mailimap_fetch_type *fetch_type = mailimap_fetch_type_new_fetch_att_list_empty();
  mailimap_section *section = mailimap_section_new(NULL);
  mailimap_fetch_att *fetch_att = mailimap_fetch_att_new_body_peek_section(section);

  int status1 = mailimap_fetch_type_new_fetch_att_list_add(fetch_type, fetch_att);
  check_error(status1, ERROR_MSG_PREFIX);

  int status2 = mailimap_uid_fetch(session, set, fetch_type, &fetch_result);
  check_error(status2, ERROR_MSG_PREFIX);
   
  msg_content = get_msg_content(fetch_result, &msg_len); //Get the body of the message
  string body(msg_content);

  mailimap_set_free(set); //Free memory
  mailimap_fetch_list_free(fetch_result); //Free memory
  
  return body;
}

//Get the specified field of the message by parsing the rfc822 header
string Message::getField(string fieldname) {
  size_t msg_len;
  clist *fetch_result = clist_new();
  clist *hdr_list = clist_new();
  int strlen = fieldname.length();

  //Convert fieldname to char*
  char arr[strlen + 1];
  strcpy(arr, fieldname.c_str());
  clist_append(hdr_list, arr);

  mailimap_set *set = mailimap_set_new_single(uid);
  mailimap_fetch_type *fetch_type = mailimap_fetch_type_new_fetch_att_list_empty();
  mailimap_header_list *header_list = mailimap_header_list_new(hdr_list);
  mailimap_section *section = mailimap_section_new_header_fields(header_list);
  mailimap_fetch_att *fetch_att1 = mailimap_fetch_att_new_body_peek_section(section);

  int status1 = mailimap_fetch_type_new_fetch_att_list_add(fetch_type, fetch_att1);
  check_error(status1, ERROR_MSG_PREFIX);
  
  int status2 = mailimap_uid_fetch(session, set, fetch_type, &fetch_result);
  check_error(status2, ERROR_MSG_PREFIX);

  //Fetch the contents of the field and store as char*
  char *msg_content;
  msg_content = get_msg_content(fetch_result, &msg_len);
  string field(msg_content);

  //Parse and remove the prepended field name 
  size_t fieldname_start, fieldname_end, result_start, result_end;
  string rfc = field;
  fieldname_start = rfc.find(fieldname);
  fieldname_end = rfc.find(" ", fieldname_start + 1);

  //Parse and extract the required contents of the field (if it exists)
  if (fieldname_start != string::npos) {
    result_start = fieldname_end + 1;
    result_end = rfc.find("\n", result_start + 1);
    string ans(rfc.substr(result_start, result_end - result_start - 1)); //We use the minus 1 to remove the ugly special character that would have otherwise been appended
    return ans;
  }
  else {
    if (fieldname == "Subject")
      return "<No subject>";
    else if (fieldname == "From")
      return "<No sender info>";
    else if (fieldname == "UID")
      return to_string(uid);
  }

  mailimap_set_free(set); //Free memory
  mailimap_fetch_list_free(fetch_result); //Free memory
}

//Helper function
char* Message::get_msg_content(clist *fetch_result, size_t *p_msg_size) {	
  //For each message (there will be probably only one message) 
  for(clistiter *cur = clist_begin(fetch_result) ; cur != NULL ; cur = clist_next(cur)) {
    size_t msg_size;
   		
    mailimap_msg_att *msg_att = (mailimap_msg_att*)clist_content(cur);
    char *msg_content = get_msg_att_msg_content(msg_att, &msg_size);
    if (msg_content == NULL) {
      continue;
    }
		
    *p_msg_size = msg_size;
    return msg_content;
  }
	
  return NULL;
}

//Helper function
char* Message::get_msg_att_msg_content(mailimap_msg_att *msg_att, size_t *p_msg_size) {
  //Iterate on each result of one given message
  for(clistiter *cur = clist_begin(msg_att->att_list) ; cur != NULL ; cur = clist_next(cur)) {
    mailimap_msg_att_item * item;
		
    item = (mailimap_msg_att_item*)clist_content(cur);
    if (item->att_type != MAILIMAP_MSG_ATT_ITEM_STATIC) {
      continue;
    }
		
    if (item->att_data.att_static->att_type != MAILIMAP_MSG_ATT_BODY_SECTION) {
      continue;
    }
		
    *p_msg_size = item->att_data.att_static->att_data.att_body_section->sec_length;
    return item->att_data.att_static->att_data.att_body_section->sec_body_part;
  }
	
  return NULL;
}

//Delete the messages from the mailbox that have the deleted flag set
void Message::deleteFromMailbox() {
  mailimap_flag_list *flag_list = mailimap_flag_list_new_empty();
  mailimap_flag *flag = mailimap_flag_new_deleted();
  int status1 = mailimap_flag_list_add(flag_list, flag);
  check_error(status1, ERROR_MSG_PREFIX);
  
  mailimap_store_att_flags *store_att_flags = mailimap_store_att_flags_new_set_flags(flag_list);
  mailimap_set *set = mailimap_set_new_single(uid);
  int status2 = mailimap_uid_store(session, set, store_att_flags);
  check_error(status2, ERROR_MSG_PREFIX);
  
  mailimap_expunge(session);
  mailimap_store_att_flags_free(store_att_flags); //Free memory
  msg_function(); //Refresh the UI after every delete

  mailimap_set_free(set); //Free memory
}

//Create a new imap session
Session::Session(function<void()> updateUI) {
  session = mailimap_new(0, NULL);
  session_function = updateUI;
}

//Get all messages in the INBOX mailbox terminated by a nullptr 
Message** Session::getMessages() {
  vector<Message*> message_vector; //For temporary storage only
  int index = 0;
  
  clist *fetch_result;
  auto set = mailimap_set_new_interval(1, 0);
  auto fetch_type = mailimap_fetch_type_new_fetch_att_list_empty();
  auto fetch_att = mailimap_fetch_att_new_uid();
  mailimap_fetch_type_new_fetch_att_list_add(fetch_type, fetch_att);

  //Handle the case where there are 0 messages to fetch, which would result in a segmentation fault
  try {
    int status1 = mailimap_fetch(session, set, fetch_type, &fetch_result);
    check_error(status1, ERROR_MSG_PREFIX);
  } catch (const exception &e) {
    message_array = new Message* [1];
    message_array[0] = NULL;
    return message_array;
  }

  //Fetch the messages if there are messages to fetch
  for (clistiter* iter = clist_begin(fetch_result); iter != NULL; iter = clist_next(iter)) {
    auto msg_att = clist_content(iter);
    uint32_t uid = get_uid((mailimap_msg_att*)msg_att);

    //Store the Messages* in a vector because we do not know the number of messages beforehand
    message_vector.push_back(new Message(uid, session, session_function));
    index++;
  }

  //Create the required size of the Message* array to hold the Message* objects. Thereafter assign elements of the array using elements in the vector
  message_array = new Message* [index + 1]; //Last array element holds a NULL
  for (int i = 0; i < message_vector.size(); i++)
    message_array[i] = message_vector[i];
  message_array[index] = NULL;

  mailimap_set_free(set); //Free memory
  mailimap_fetch_list_free(fetch_result); //Free memory  
  
  return message_array;
}

//Return the uid of the messages in the inbox
uint32_t Session::get_uid(mailimap_msg_att * msg_att) {	
  //Iterate on each result of one given message 
  for(clistiter *cur = clist_begin(msg_att->att_list) ; cur != NULL ; cur = clist_next(cur)) {
    mailimap_msg_att_item *item = (mailimap_msg_att_item*)clist_content(cur);
    if (item->att_type != MAILIMAP_MSG_ATT_ITEM_STATIC) 
      continue;
		
    if (item->att_data.att_static->att_type != MAILIMAP_MSG_ATT_UID) 
      continue;
		
    return item->att_data.att_static->att_data.att_uid;
  }	
  return 0;
}

//Connect to the imap server
void Session::connect(string const& server, size_t port) {
  int status = mailimap_socket_connect(session, server.c_str(), port);
  check_error(status, ERROR_MSG_PREFIX);
}

//Login to the imap server
void Session::login(string const& userid, string const& password) {
  int status = mailimap_login(session, userid.c_str(), password.c_str());
  check_error(status, ERROR_MSG_PREFIX);
}

//Select the specified mailbox in order to access the messages of the mailbox
void Session::selectMailbox(string const& mailbox) {
  int status = mailimap_select(session, mailbox.c_str());
  check_error(status, ERROR_MSG_PREFIX);
}

//Clear all dynamically-allocated messages, logout, and then free the mailimap session
Session::~Session() {
  for (int i = 0; message_array[i]; i++)
    delete message_array[i];
  mailimap_logout(session); //Logout from session
  mailimap_free(session); //Free memory
}
