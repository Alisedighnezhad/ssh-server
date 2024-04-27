#!/bin/bash

# تعریف تابع برای تولید یک رمز عبور
pass() {
    All="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?/~"
    pass=""
    for ((i = 0; i < 8; i++)); do
        pass+=${All:$RANDOM % ${#All}:1}
    done
    echo $pass
}

# تعریف تابع برای تولید یک شناسه کاربری
userid() {
    All="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    id=""
    for ((i = 0; i < 8; i++)); do
        id+=${All:$RANDOM % ${#All}:1}
    done
    echo $id
}

# ایجاد ۱۰۰ کاربر جدید
u=0
while [ $u -lt 100 ]; do
    echo "sudo adduser --gecos 'Fullname,Room Number,Work Phone,Home Phone' --password $(pass) $(userid)"
    u=$((u + 1))
done

# صفحه‌بندی نهایی
read -p "Press any key to exit..."
