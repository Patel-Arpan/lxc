#!/bin/sh

echo "Export the toolchain binaries"
# set up toolchain path
#export PATH=$PATH:/home/user/android/android-ndk-r25b/toolchains/llvm/prebuilt/linux-x86_64/bin/
echo "exported toolchain binaries from /opt/android/android-ndk-r25n"

# setup lxc
echo "using cross-file aosp-lxc.ini and args to setup meson build"
meson setup --cross-file aosp-lxc.ini --prefix /data/lxc/lxc --bindir /vendor/bin --datadir share --includedir include --infodir share/info --libdir /vendor/lib64 --libexecdir /vendor/lib64 --localedir share/locale --localstatedir /data/lxc/lxc/var --mandir share/man --sbindir /vendor/bin --sysconfdir /system/etc --buildtype debug --default-library both --strip -Dinit-script=[] -Dman=false -Dpam-cgroup=false -Dtests=false -Dglobal-config-path=/data/lxc/containers/ -Druntime-path=/data/lxc/cache/ build
#meson setup --cross-file aosp-lxc.ini --prefix /data/lxc/lxc --bindir bin --datadir share --includedir include --infodir share/info --libdir lib64 --libexecdir libexec --localedir share/locale --localstatedir /data/lxc/lxc/var --mandir share/man --sbindir sbin --sysconfdir etc --buildtype debug --default-library both --strip -Dinit-script=[] -Dman=false -Dpam-cgroup=true -Dtests=false -Dglobal-config-path=/data/lxc/containers/ -Druntime-path=/data/lxc/cache/ build

echo "compiling lxc"
# compile lxc
meson compile -C  build -j 24

echo "install to destdir data inside build folder" 
# install to dir - data
meson install --destdir data -C build

echo "output files will be available inside build/data folder"
exit 0
