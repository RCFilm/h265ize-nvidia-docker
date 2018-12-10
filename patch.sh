#!/bin/bash

backup_path="libnvidia-encode-backup"
driver_dir='/usr/lib/x86_64-linux-gnu'

test -d "$driver_dir" || { echo "ERROR: cannot detect driver directory"; exit 1; }

declare -A patch_list=(
    ["375.39"]='s/\x85\xC0\x89\xC5\x75\x18/\x29\xC0\x89\xC5\x90\x90/g'
    ["396.24"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
    ["396.26"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
    ["396.37"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g' #added info from https://github.com/keylase/nvidia-patch/issues/6#issuecomment-406895356
    # break nvenc.c:236,layout asm,step-mode,step,break *0x00007fff89f9ba45
    # libnvidia-encode.so @ 0x15a45; test->sub, jne->nop-nop-nop-nop-nop-nop
    ["396.54"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
    ["410.48"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
    ["410.57"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
    ["410.73"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
    ["410.78"]='s/\x85\xC0\x89\xC5\x0F\x85\x96\x00\x00\x00/\x29\xC0\x89\xC5\x90\x90\x90\x90\x90\x90/g'
)

driver_version=$1
if [[ ! $? -eq 0 ]]; then
    echo 'Something went wrong. Check nvidia driver'
    exit 1;
fi

echo "Detected nvidia driver version: $driver_version"

patch=${patch_list[$driver_version]}

if [[ ! $patch ]]; then
    echo "Patch for this ($driver_version) nvidia driver not found." 1>&2
    echo "Available patches for: " 1>&2
    for drv in "${!patch_list[@]}"; do
        echo "$drv" 1>&2
    done
    exit 1;
fi

if [[ ! -f $backup_path/libnvidia-encode.so.$driver_version ]]; then
    echo "Attention! Backup not found. Copy current libnvidia-encode to backup."
    mkdir -p $backup_path
    cp -p $driver_dir/libnvidia-encode.so.$driver_version \
       $backup_path/libnvidia-encode.so.$driver_version
fi
sha1sum $backup_path/libnvidia-encode.so.$driver_version
sed "$patch" $backup_path/libnvidia-encode.so.$driver_version > \
  $driver_dir/libnvidia-encode.so.$driver_version
sha1sum $driver_dir/libnvidia-encode.so.$driver_version
ldconfig
echo "Patched!"
