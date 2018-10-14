#! /bin/bash

# Make sure the script is being executed with superuser privileges.

# Get the username (login).
read -p 'Please enter the new user username: ' USERNAME 

# Get the real name (contents for the description field).
read -p 'Please enter the new user actual name: ' REALNAME

# Get the password.
read -p 'Please enter the new user initial login password: ' PASSWORD

# Create the user with the password.
useradd -c "${REALNAME}" -m ${USERNAME} 

# Check to see if the useradd command succeeded.
if [[ ${?} -ne 0 ]]
then
   echo 'new user was not successfully created!'
   exit 1
fi

# Set the password.
echo "${PASSWORD}" | passwd --stdin ${USERNAME}
passwd -e ${USERNAME}

# Check to see if the passwd command succeeded.
if [[ ${?} -ne 0 ]]
then
   echo 'new user password setting failed!'
   exit 2
fi

# Force password change on first login.
passwd -e ${USERNAME}

# Display the username, password, and the host where the user was created.
echo 'New user info'
echo "Username: ${USERNAME}"
echo "Name: ${REALNAME}"
echo "Password: ${PASSWORD}" 
