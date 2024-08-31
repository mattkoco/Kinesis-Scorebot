# Kinesis-Scorebot
***What is it?***

- Kinesis Scorebot is a Linux CyberPatriot practice image scorebot written in bash. It uses the command 'curl' to pull the scorebot code from a github repository.

***Why not just store the scorebot code locally?***

- While in some cases scorebot code could be stored locally on the image, hosting it on Github allows for the option to change scorebot code on the fly. It also allows for injections.

***How does it work?***

- Kinesis was built around being easy to use. There are 5 different functions available to use. These are:
  - check_text_exists "/path/to/file" "text" "vuln name"
    - Checks if text is present inside of a file.
  - check_text_not_exists "/path/to/file" "text" "vuln name"
    - Checks if text is NOT present inside of a file.
  - check_file_exists "/path/to/file" "vuln name"
    - Checks if a file exists
  - check_file_deleted "/path/to/file" "vuln name"
    - Checks if a file is deleted (if it does not exist)
  - check_file_permissions "/path/to/file" "644" "vuln name"
    - Checks the permissions on any given file.
- In order to run the scorebot, the user simply types in 'score' to the terminal.

***Setup***

1. Create a Scoring directory. This can be anywhere on the system.
2. Copy/paste (hyperlink) into a file. (!!! NOTE: MAKE SURE TO SUBSTITUTE THE DESIGNATED LINES INSIDE OF THE SCOREBOT !!!)
3. Add an alias inside of /etc/bash.bashrc that links the term 'score' to the scorebot.
4. Thats it!
