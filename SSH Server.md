<ol>
<li class="has-line-data" data-line-start="0" data-line-end="2"><strong>Create a new group for VPN users</strong></li>
</ol>
<p class="has-line-data" data-line-start="2" data-line-end="3">Open the terminal and run the following command to create a new group named “VPNs”:</p>
<pre><code class="has-line-data" data-line-start="5" data-line-end="7">sudo groupadd VPNs
</code></pre>
<ol start="2">
<li class="has-line-data" data-line-start="8" data-line-end="10"><strong>Set permissions for the VPNs group</strong></li>
</ol>
<p class="has-line-data" data-line-start="10" data-line-end="11">To grant the VPNs group access to log in, read, and write directories, you need to modify the permissions accordingly. Here’s an example command to grant read, write, and execute permissions to the “/home” directory for the VPNs group:</p>
<pre><code class="has-line-data" data-line-start="13" data-line-end="15">sudo chmod -R 770 /home &amp;&amp; sudo chgrp -R VPNs /home
</code></pre>
<p class="has-line-data" data-line-start="16" data-line-end="17">This command recursively changes the permissions of the “/home” directory and its subdirectories to allow read, write, and execute access for the owner and the VPNs group.</p>
<ol start="3">
<li class="has-line-data" data-line-start="18" data-line-end="20"><strong>Install the OpenSSH server</strong></li>
</ol>
<p class="has-line-data" data-line-start="20" data-line-end="21">Run the following command to install the OpenSSH server:</p>
<pre><code class="has-line-data" data-line-start="23" data-line-end="26">sudo apt update
sudo apt install openssh-server
</code></pre>
<ol start="4">
<li class="has-line-data" data-line-start="27" data-line-end="29"><strong>Configure the SSH server for VPN users</strong></li>
</ol>
<p class="has-line-data" data-line-start="29" data-line-end="30">Open the SSH server configuration file using a text editor with root privileges:</p>
<pre><code class="has-line-data" data-line-start="32" data-line-end="34">sudo nano /etc/ssh/sshd_config
</code></pre>
<p class="has-line-data" data-line-start="35" data-line-end="36">Locate the following lines and modify them as shown below:</p>
<pre><code class="has-line-data" data-line-start="38" data-line-end="41">PermitRootLogin no
AllowGroups VPNs
</code></pre>
<p class="has-line-data" data-line-start="42" data-line-end="43">These lines prevent root login and allow only users from the VPNs group to connect via SSH.</p>
<p class="has-line-data" data-line-start="44" data-line-end="45">Additionally, you can add the following line to restrict users from running commands on the server:</p>
<pre><code class="has-line-data" data-line-start="47" data-line-end="49">ForceCommand /bin/true
</code></pre>
<p class="has-line-data" data-line-start="50" data-line-end="51">This will prevent users from executing any commands on the server and allow them to use SSH only for tunneling purposes.</p>
<p class="has-line-data" data-line-start="52" data-line-end="53">Save the changes and exit the text editor.</p>
<ol start="5">
<li class="has-line-data" data-line-start="54" data-line-end="56"><strong>Restart the SSH server</strong></li>
</ol>
<p class="has-line-data" data-line-start="56" data-line-end="57">To apply the new configuration, restart the SSH server:</p>
<pre><code class="has-line-data" data-line-start="59" data-line-end="61">sudo systemctl restart sshd
</code></pre>
<p class="has-line-data" data-line-start="62" data-line-end="63">Now, users who are members of the VPNs group can connect to the SSH server, but they won’t be able to run any commands or access the shell. They can use the SSH connection for tunneling purposes, such as setting up a VPN connection.</p>
<p class="has-line-data" data-line-start="64" data-line-end="65">Note: Make sure to add users to the VPNs group using the <code>sudo usermod -a -G VPNs username</code> command before they can connect to the SSH server.</p>