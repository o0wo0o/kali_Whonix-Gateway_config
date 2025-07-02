#!/bin/bash
 
# Отключаем интерфейс eth0
ifdown eth0
 
# Заменяем содержимое /etc/resolv.conf
echo "nameserver 10.152.152.10" > /etc/resolv.conf
 
# Конфигурация для интерфейса eth0
CONFIG=$(cat <<EOF
 
# Static configuration for eth0
iface eth0 inet static
    address 10.152.152.11
    netmask 255.255.192.0
    gateway 10.152.152.10
EOF
)
 
# Добавляем конфигурацию в конец /etc/network/interfaces
echo "$CONFIG" >> /etc/network/interfaces
 
# Включаем интерфейс eth0
ifup eth0
 
