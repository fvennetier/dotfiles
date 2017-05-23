#!/bin/bash

# 8 is invisible
for x in {0..7}; do
    for i in {30..37} {90..97}; do
        for a in {40..47}; do
            echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
        done
        echo
    done
done
echo ""
