#!/bin/bash

# default values
width=1920
height=1080

# get from config file
if test -f $HOME/.config/displayphone/config ; then
  . $HOME/.config/displayphone/config
fi

# get from arguments
while getopts "h:w:" opt; do
  case $opt in
    h) height=$OPTARG ;;
    w) width=$OPTARG ;;
  esac
done

echo $height
echo $width
ADB_COMMAND_START="adb shell wm size ${height}x${width}"
ADB_COMMAND_END="adb shell wm size 1080x2400"

check_error() {
    if [ $? -ne 0 ]; then
        echo "An error has occurred"
        read -n 1 -s -r -p "Press any key to exit..."
        exit 1
    fi
}

echo "Setting screen resolution and starting scrcpy..."
$ADB_COMMAND_START
check_error

scrcpy -b 30m &
scrcpy_pid=$!
wait $scrcpy_pid
echo "scrcpy closed, restoring phone resolution..."
check_error


$ADB_COMMAND_END
check_error
wait .5 #wait half a second before continuing
