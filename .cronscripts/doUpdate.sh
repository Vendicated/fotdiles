#!/bin/sh
set -e
/home/ven/.cronscripts/waitfornetwork.sh
pacman -Syu --noconfirm
