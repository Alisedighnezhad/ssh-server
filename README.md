#SSH Server
1. **Create a new group for VPN users**

Open the terminal and run the following command to create a new group named "VPNs":

```
sudo groupadd VPNs
```

2. **Set permissions for the VPNs group**

To grant the VPNs group access to log in, read, and write directories, you need to modify the permissions accordingly. Here's an example command to grant read, write, and execute permissions to the "/home" directory for the VPNs group:

```
sudo chmod -R 770 /home && sudo chgrp -R VPNs /home
```

This command recursively changes the permissions of the "/home" directory and its subdirectories to allow read, write, and execute access for the owner and the VPNs group.

3. **Install the OpenSSH server**

Run the following command to install the OpenSSH server:

```
sudo apt update
sudo apt install openssh-server
```

4. **Configure the SSH server for VPN users**

Open the SSH server configuration file using a text editor with root privileges:

```
sudo nano /etc/ssh/sshd_config
```

Locate the following lines and modify them as shown below:

```
PermitRootLogin no
AllowGroups VPNs
PasswordAuthentication yes
AllowUsers  user  user2
```

These lines prevent root login and allow only users from the VPNs group to connect via SSH.

Additionally, you can add the following line to restrict users from running commands on the server:

```
ForceCommand /bin/true
```

This will prevent users from executing any commands on the server and allow them to use SSH only for tunneling purposes.

Save the changes and exit the text editor.

5. **Restart the SSH server**

To apply the new configuration, restart the SSH server:

```
sudo systemctl restart sshd
```

Now, users who are members of the VPNs group can connect to the SSH server, but they won't be able to run any commands or access the shell. They can use the SSH connection for tunneling purposes, such as setting up a VPN connection.

Note: Make sure to add users to the VPNs group using the `sudo usermod -a -G VPNs username` command before they can connect to the SSH server.
