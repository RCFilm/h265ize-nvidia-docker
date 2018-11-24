# Plex NVIDIA Docker

[![Docker Automated build](https://img.shields.io/docker/automated/bassrock/plex-nvidia-docker.svg)](https://hub.docker.com/r/bassrock/plex-nvidia-docker)
[![Docker Build Status](https://img.shields.io/docker/build/bassrock/plex-nvidia-docker.svg)](https://hub.docker.com/r/bassrock/plex-nvidia-docker/)

This image is based on the LinuxServer.io and includes the necessary drivers to pass through the NVIDIA graphics cards to Plex.

Make sure to pass through /dev/dri as a read-write folder. It seems to not work when passed as a device.

# Usage With UnRAID

This works with UnRAID when used with this plugin: https://github.com/CHBMB/Unraid-NVIDIA-Plugin or building your own here: https://github.com/CHBMB/Unraid-NVIDIA 

You need to use the tag of this docker that corresponds to the driver version that is installed in your base kernel.
