### Shell scripting study

1. VirtualBox and Vagrant 
   - How to automate loading of single or multiple VMs 
   - vagrant ssh to login to each loaded vm 
   - vm can talk to each other 
   - vm can access the host’s folder.
2. VIM commands 
   - cut and paste (Ctrl-V, y and p to paste) 
   - search, / or ? [search item]. Press n to search next or shift-n to search back.
3. more, less, most command
   more - old command, unable to scroll up but Mac seem to have wired more to less
   less - like more but can scroll up and down
   most - supposedly more powerful than less but not available in Mac by default.
4. Installation of VirtualBox can fail due to the need to trust Oracle from Mac’s security and Privacy setting. VirtualBox will appear to be installed but no VMs will be loadable.
5. Bash script
   - what is shebang #!  
     #! [Path to the interpreter]  
     ```
     #!/bin/bash            <=== bash interpreter  
     #!/usr/bin/python      <=== python  
     #!/bin/ruby            <=== ruby
     ```
   - chmod 755 (or +x), default setting for script. To x, you must have r. 
   - variables  
     - as a good practice, variable is all caps.   
     - assignment, a=b, must not have spacing between the =.  
     - can begin with alphabet or underscore but not a number.  
     - access the content by prefixing $ or wrap with ${var}     
       ${var} is specially useful if you want to concatenate with other text without spacing.            
       ```
       ${var}ing, de${var}
       ```
   - single vs double quotes  
     - single quotes does not allow interpolation.   
     - double quotes allows interpolation, such as display or variable
   - conditional statement   
     ``` 
     if [[ “${UID} -eq 0 ]]                <=== observe the spacing. Single [ ] is old convention   
        then                               <=== next line can be substituted with ;       
           echo ‘You are root.’   
        else      
           echo ‘You are not root.’   
     fi
     ```
   - ${?} to get the exit status
   - = vs == in conditional statement   
     = is to look for exact match   
     == is to look for pattern match
   - getting user input
     ```
     read -p 'Type something: ' THING     <=== User input will be stored into THING variable
     ```
6. To know if a command is a shell building, use type command. Use help command to know more.
   If a command is not a shell buildin, use man command to know more.
7. Executing a shell executable with options, multiple options can be combine with single - in front.
8. Shell commands
   - touch  
     Create an empty file if does not exist or change the date of the file to current if exist.
   - type   
     To find out the command type (alias, shell function, shell building, disk file or reserved word)
   - id
   - test  
   - useradd (creating a new user)
     ```
     useradd -c "${FRIENDLYNAME}" -m ${USERNAME}    <=== -m is to create a home directory
                                                         (can also be automatically created 
                                                          depending on etc/login.def)
     ```
   - read (getting user input) 
     ```
     read -p 'comment: ' VAR_RCV_INPUT
     ```
   - passwd 
     ```
     echo ${PASSWORD} | passwd --stdin ${USERNAME}  <=== pipe PASSWORD var into passwd
     passwd -e ${USERNAME}                          <=== make USERNAME account's password expire
     ```
9. In a script, command with options can be assigned to a variable:  
   ```  
   VAR1 = $(id -un)  
   VAR1 = ‘id -un’      <=== older convention 
   ```