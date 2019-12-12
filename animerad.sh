#!/bin/bash
function shows() {
    NUM=$(trackma ls | grep results | head -c1)
    echo $NUM
}

function random_show() {
    shuf -i 1-$(shows) -n 1

}

function play_show() {
    SHOW=$(random_show)
    echo -e "rescan \n play $SHOW \n update $SHOW" | trackma
}

function is_playing() {
    top -bn1 | grep -q mpv
    echo $?
}

function sleep_while_playing() {
    while [ $(is_playing) -eq 0 ]
    do
        sleep 1
    done
}

function main() {
    while :
    do
        play_show
        sleep_while_playing
    done
}

main
