#ifndef IMAP_H
#define IMAP_H
#include "imaputils.hpp"
#include <libetpan/libetpan.h>
#include <string>
#include <functional>

namespace IMAP {
class Message {
public:
	Message(){}
	std::string getBody();
	std::string getField(std::string fieldname);
	void deleteFromMailbox();
};

class Session {
public:
	Session(std::function<void()> updateUI);

	Message** getMessages();

	void connect(std::string const& server, size_t port = 143);

	void login(std::string const& userid, std::string const& password);

	void selectMailbox(std::string const& mailbox);

	~Session();
};
}

#endif /* IMAP_H */
