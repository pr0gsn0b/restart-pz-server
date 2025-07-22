#!/bin/bash

if ! rcon -a 10.0.0.74:27015 -p 1234 'players' | grep -q "(0)"; then
    echo "players connected"
    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 5 minutes. Get to a safe place!"'
    sleep 240

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server will restart in 1 minute. Get to a safe place!"'
    sleep 30

    rcon -a 10.0.0.74:27015 -p 1234 'servermsg "Server restarting in 30 seconds!"'
    sleep 15

    rcon -a 10.0.0.74:27015 -p 1234 'save'
    sleep 15

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
