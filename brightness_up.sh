#!/bin/bash 
# Change the screen brightness using the virtual device. 
# I use this for saving my retinas from over exposure during 
# late night system usages. 

# The interest in this came from fiddling around with the brightness 
# applet in gnome.   Was trying to make a full move to Enlightenment desktop
# didn't know any other way to control the brightness there. 
# 
# parameters: when run without any it sets the brightness to level 3 
# when given a parameter it sets it to that entered level 
#
# Kish 

if [ $# -ne 1 ];then
sudo echo 3 >/sys/devices/virtual/backlight/acpi_video0/brightness


else

sudo echo $1 >/sys/devices/virtual/backlight/acpi_video0/brightness

fi

