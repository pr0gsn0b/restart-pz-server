#!/bin/bash

if ! rcon -a 10.0.0.74:27015 -p 1234 'players' | grep -q "(0)"; then
    echo "players connected"
    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 5 minutes. Get to a safe place!"'
    sleep 60

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 4 minutes. Get to a safe place!"'
    echo "4min"
    sleep 60

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 3 minutes. Get to a safe place!"'
    echo "3min"
    sleep 60

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 2 minutes. Get to a safe place!"'
    echo "2min"
    sleep 60

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 1 minutes. Get to a safe place!"'
    echo "1min"
    sleep 30

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 30 seconds!"'
    rcon -a 10.0.0.74:27015 -p 1234 'save'
    echo "30sec"
    sleep 30

    rcon -a 10.0.0.74:27015 -p 1234 'quit'
    sleep 15

    ssh root@10.0.0.74 'systemctl restart pz-server'
else
    echo "no players connected"
    rcon -a 10.0.0.74:27015 -p 1234 'save'
    sleep 15

    rcon -a 10.0.0.74:27015 -p 1234 'quit'
    sleep 15

    ssh root@10.0.0.74 'systemctl restart pz-server'
fi
