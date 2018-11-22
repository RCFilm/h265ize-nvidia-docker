# Plex Nvidia Docker

[![Docker Automated build](https://img.shields.io/docker/automated/bassrock/plex-nvidia-docker.svg)](https://github.com/bassrock/plex-nvidia-docker)
[![Docker Build Status](https://img.shields.io/docker/build/bassrock/plex-nvidia-docker.svg)](https://github.com/bassrock/plex-nvidia-docker)

This image is based on the LinuxServer.io and includes the necessary drivers to pass through the Nvidia graphcis cards to Plex.

Make sure to pass through /dev/dri as a read-write folder. It seems to not work when passed as a device.

# Usage With UnRAID

This works with UnRAID when used with this plugin: https://github.com/CHBMB/Unraid-NVIDIA-Plugin, After installing the plugin go to settings and pick your UnRAID build to install.
