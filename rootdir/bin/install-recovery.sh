#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/recovery$(getprop ro.boot.slot_suffix):40370176:28139f8b150bf9054e35ef6ae79c529562a4be21; then
  applypatch --bonus /vendor/etc/recovery-resource.dat \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot$(getprop ro.boot.slot_suffix):31928320:d4c54e6332e0b11fa61333d2e1c7ab22433efa57 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/recovery$(getprop ro.boot.slot_suffix):40370176:28139f8b150bf9054e35ef6ae79c529562a4be21 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
