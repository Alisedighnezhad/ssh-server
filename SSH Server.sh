#!/bin/bash

# Making Random Pass 
pass() {
    All="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()-_=+[]{}|;:,.<>?/~"
    pass=""
    for ((i = 0; i < 8; i++)); do
        pass+=${All:$RANDOM % ${#All}:1}
    done
    echo $pass
}

# Making Random Username
userid() {
    All="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    id=""
    for ((i = 0; i < 8; i++)); do
        id+=${All:$RANDOM % ${#All}:1}
    done
    echo $id
}

# Making users 
u=0
while [ $u -lt 2 ]; do
  id=$(userid) 
  pass=$(pass)
  echo "$id created with $pass password" >> log.txt  # Append to log.txt instead of overwriting
  sudo useradd -m -g VPNs $id 
  echo -e "$pass\n$pass" | sudo passwd $id
  echo "$pass"
  u=$((u + 1))
done
sudo chown -R ali:ali /home
sudo chmod -R 770 /home
sudo chgrp -R VPNs /home

# just for Cheack Data
read -p "Press any key to exit..."
