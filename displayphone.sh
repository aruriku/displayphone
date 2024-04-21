#!/bin/bash
ADB_COMMAND_START="adb shell wm size 1440x2560"
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
