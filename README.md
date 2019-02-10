work in progress does not work



Make sure to pass through /dev/dri as a read-write folder. It seems to not work when passed as a device.

# Usage With UnRAID


You need to use the tag of this docker that corresponds to the driver version that is installed in your base kernel.


```bash
#!/bin/bash

/sbin/modprobe nvidia

if [ "$?" -eq 0 ]; then
  # Count the number of NVIDIA controllers found.
  NVDEVS=`lspci | grep -i NVIDIA`
  N3D=`echo "$NVDEVS" | grep "3D controller" | wc -l`
  NVGA=`echo "$NVDEVS" | grep "VGA compatible controller" | wc -l`

  N=`expr $N3D + $NVGA - 1`
  for i in `seq 0 $N`; do
    mknod -m 666 /dev/nvidia$i c 195 $i
  done

  mknod -m 666 /dev/nvidiactl c 195 255

else
  exit 1
fi

/sbin/modprobe nvidia-uvm

if [ "$?" -eq 0 ]; then
  # Find out the major device number used by the nvidia-uvm driver
  D=`grep nvidia-uvm /proc/devices | awk '{print $1}'`

  mknod -m 666 /dev/nvidia-uvm c $D 0
else
  exit 1
fi
```
12. `chmod a+x /boot/config/nvidia.sh`
13. Add to `/boot/config/go`: `/boot/config/nvidia.sh`
14. Reboot
15. Go to settings and Click on Unraid Nvidia
16. Make note of the installed graphics drivers version
17. Create a new Docker App using the plex-nvidia-docker that corresponds to your installed driver version (the tags)
