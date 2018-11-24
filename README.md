# Plex NVIDIA Docker

[![Docker Automated build](https://img.shields.io/docker/automated/bassrock/plex-nvidia-docker.svg)](https://hub.docker.com/r/bassrock/plex-nvidia-docker)
[![Docker Build Status](https://img.shields.io/docker/build/bassrock/plex-nvidia-docker.svg)](https://hub.docker.com/r/bassrock/plex-nvidia-docker/)

This image is based on the LinuxServer.io and includes the necessary drivers to pass through the NVIDIA graphics cards to Plex.

Make sure to pass through /dev/dri as a read-write folder. It seems to not work when passed as a device.

# Usage With UnRAID

This works with UnRAID when used with this plugin: https://github.com/CHBMB/Unraid-NVIDIA-Plugin or building your own here: https://github.com/CHBMB/Unraid-NVIDIA

You need to use the tag of this docker that corresponds to the driver version that is installed in your base kernel.

# Known Steps to Make It Work (Building Your Own)
1. Make sure you are on the latest unRaid *Stock* Version (Latest Tested 6.6.5)
2. Install this plugin: `https://raw.githubusercontent.com/CHBMB/Unraid-NVIDIA-Plugin/master/plugins/UnraidNVIDIA.plg`
3. Create a new share to hold your builds, (unraid-builds) In the following steps.
4. ssh to the server 
5. `cd /mnt/user/unraid-builds`
6. Create a script with the contents from the ReadMe Here: https://github.com/CHBMB/Unraid-NVIDIA/blob/master/README.md (nvidia-build.sh)
7. `chmod a+x ./nvidia-build.sh`
8. `./nvidia-build.sh`
9. `cd 6-6-5/nvidia`
10. `cp bzfirmware /boot/ && cp bzmodules /boot/ && cp bzimage /boot/`
11. Reboot
12. Go to settings and Click on Unraid Nvidia
13. Make note of the installed graphics drivers version
14. Create a new Docker App using the plex-nvidia-docker that corresponds to your installed driver version (the tags)
15. Map `/dev/dri` to `/dev/dri` As a rw volume, not a device (mapping as a device does not keep the permissions)