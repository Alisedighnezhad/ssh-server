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
while [ $u -lt 10 ]; do
        id=$(userid) 
        pass=$(pass)
        echo "$id created with $pass password" >> log.txt  # Append to log.txt instead of overwriting
        sudo useradd -m $id && echo "$id:$pass" 
        u=$((u + 1))
done

# just for Cheack Data
read -p "Press any key to exit..."
