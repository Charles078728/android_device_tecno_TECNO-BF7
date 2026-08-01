#!/bin/bash

# Copyright (C) 2025-2026 OrangeFox Recovery Project
# Copyright (C) 2026 chkndrp
# SPDX-License-Identifier: GPL-3.0-only

FDEVICE="BF7"

fox_get_target_device() {
    local chkdev=""
    
    if [ -n "$ZSH_VERSION" ]; 
      then
        local current_source="${(%):-%x}"
        chkdev=$(echo "$current_source" | grep -w "$FDEVICE")
    elif [ -n "$BASH_VERSION" ];
      then chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    fi

    if [ -n "$chkdev" ]; 
      then FOX_BUILD_DEVICE="$FDEVICE"
    else
        if [ -n "$BASH_VERSION" ]; 
          then chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        elif [ -n "$ZSH_VERSION" ]; 
          then chkdev=$(echo "$*" | grep -w "$FDEVICE")
        fi
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; 
  then fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ];
  then
    export TARGET_DEVICE_ALT="BF7"


    # Settings/Data storage locations
    export FOX_SETTINGS_ROOT_DIRECTORY="/data/recovery"

    # Addons
    export FOX_ENABLE_APP_MANAGER=1

    # Magisk / KernelSU(-Next) / SukiSU support
    export FOX_ENABLE_KERNELSU_SUPPORT=1
    export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
    export FOX_ENABLE_SUKISU_SUPPORT=1
    
    # A/B partitioning
    export FOX_VIRTUAL_AB_DEVICE=1
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    # Very interesting, drops the ramdisk image size by ~6MB
    # While keeping the same boot times. Needs testing.
    # export FOX_COMPRESS_EXECUTABLES=1
  

    export LC_ALL="C"
    export BUILD_USERNAME=Charles078728
    export BUILD_HOSTNAME=github

    # Debugging
    ## export FOX_RESET_SETTINGS=0
    ## export FOX_INSTALLER_DEBUG_MODE=1
    ## OF_REPORT_HARMLESS_MOUNT_ISSUES=1
  else
    if [ -z "$FOX_BUILD_DEVICE" ] && [ -z "$BASH_SOURCE" ] && [ -z "$ZSH_VERSION" ]; 
      then echo "I: This script requires bash or zsh. Not processing $FDEVICE"
    fi
fi
