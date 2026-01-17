# Twrp Tree For Tecno Spark Go 2023(BF7)

# Checks
Blocking checks
- [✔] Correct screen/recovery size
- [✔] Working Touch, screen
- [ X ] Backup to internal/microSD
- [ X ] Restore from internal/microSD
- [ X ] reboot to system
- [?] ADB

Medium checks
- [ X ] update.zip sideload
- [?] UI colors (red/blue inversions)
- [?] Screen goes off and on
- [?] F2FS/EXT4 Support, exFAT/NTFS where supported
- [✔] all important partitions listed in mount/backup lists
- [ X ] backup/restore to/from external storage
- [?] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [ X ] decrypt /data
- [✔] Correct date

Minor checks
- [?] MTP export
- [✔] reboot to bootloader
- [✔] reboot to recovery
- [ X ] poweroff
- [✔] battery level
- [✔] temperature
- [?] encrypted backups
- [ X ] input devices via USB (USB-OTG) - keyboard and mouse and storage
- [✔] USB mass storage export
- [?] set brightness
- [?] vibrate
- [?] screenshot
- [✔] partition SD card
- [✔] Fastbootd
- [ X ] Flashing image or magisk.zip file

# Clone (example)
    git clone https://github.com/Charles078728/android_device_TECNO-BF7.git -b main device/tecno/BF7 

# Build
    export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch pbrp-eng; mka bootimage
