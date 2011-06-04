#!/bin/bash
time {
   rm -rf /lfs/cross-tools/* /lfs/tools/* /lfs/build/* &&
   rm -rf /lfs/bin /lfs/etc /lfs/lib /lfs/mnt /lfs/root \
          /lfs/tmp /lfs/var /lfs/boot/* /lfs/opt /lfs/sbin \
          /lfs/srv /lfs/dev /lfs/home /lfs/media /lfs/proc \
          /lfs/share /lfs/sys /lfs/usr &&
  ~eric/src/sysbuild/make_toolchain > /lfs/Logs/00_make_toolchain.$(date --utc +"%F_%H%M%S").out 2>&1 &&
  ~eric/src/sysbuild/01_temp_system > /lfs/Logs/01_temp_system.$(date --utc +"%F_%H%M%S").out 2>&1 &&
  ~eric/src/sysbuild/02_setup_filesystem > /lfs/Logs/02_setup_file_system.$(date --utc +"%F_%H%M%S").out 2>&1 &&
  ~eric/src/sysbuild/03_temp_system_boot > /lfs/Logs/03_temp_system_boot.$(date --utc +"%F_%H%M%S").out 2>&1 &&
 echo YAY >> /lfs/Logs/outcome.out ||
 echo "DARN $?" >> /lfs/Logs/outcome.out ;
}
