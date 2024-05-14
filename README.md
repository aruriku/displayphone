# Displayphone script
### simple bash script that automates resizing your phone's resolution before and after launching scrcpy.
### ⚠️ THIS IS A PERSONAL SCRIPT, NO SUPPORT ⚠️


## Dependencies
- android-tools/adb
  - the script assumes that you have permission to run adb without root access
- scrcpy
- bash

## Configuration
### Commandline arguments
`-h` to set the height to your display when running the script

`-w` to set the width to your display when running the script
#### ⚠️ There is no option to set the phones normal resolution. ⚠️

### Config file
In `$HOME/.config/displayphone/config` you may set the resolution that you desire using the keys `height` and `width`

For example,
```
width=1080
height=1920
```
### Editing the script
You could also just change the defaults within the script if you so prefer.
