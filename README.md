# MacChat
Mac-Mac P2P Chat via SSH (Terminal-GUI chat) bash script app. 

Features:
- P2P Chat via SSH
- Log chat
# Usage
Execute this from local on remote by running
```bash
$ chmod a+x ./chat.sh
$ ssh user@host.local "bash -s" < ./chat.sh "option1" "option2" "option3"
```
You can specify any of these options (on invoke):
```bash
options:
     -h  show this help text
     -t  Recipient name
     -f  Sender name
     -l  Log chat (flag)

Type "exit" in the chat to end the chat.
```
