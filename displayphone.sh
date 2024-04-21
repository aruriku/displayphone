#!/bin/bash
ADB_COMMAND_START="adb shell wm size 1440x2560"
ADB_COMMAND_END="adb shell wm size 1080x2400"
echo "Setting screen resolution and starting scrcpy..."
$ADB_COMMAND_START
scrcpy -b 30m &
scrcpy_pid=$!
wait $scrcpy_pid
echo "scrcpy closed, restoring phone resolution..."
$ADB_COMMAND_END
