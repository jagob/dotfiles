 #/bin/bash

 # A simple popup showing calender

CALENDER=$(cal -w)

# FONT="-*-ubuntu-mono-regular-*-12-*-*-*-*-*-*-*-*"
FONT="-*-terminus-medium-r-*-*-20-*-*-*-*-*-*-*"

 (
 echo "$CALENDER"
 ) | dzen2 -p -x "1400" -y "20" -w "280" -l "7" -sa 'l' -ta 'c' -fn "$FONT" -e 'onstart=uncollapse;button1=exit;button3=exit'