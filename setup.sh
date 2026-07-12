#!/bin/sh
set -e

cd

rm -rf GreenOS

echo "Cloning GreenOS"
git clone -q https://github.com/VoidStem/GreenOS.git

cd GreenOS

echo "Downloading Linux Kernel 6.18.38 (Long Term Support)"
wget -q https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.38.tar.xz

echo "Extracting linux-6.18.38.tar.xy"
tar -xf linux-6.18.38.tar.xz

echo "Renaming linux-6.18.38 to linux"
mv linux-6.18.38 linux

echo "Removing linux-6.18.38.tar.xy"
rm linux-6.18.38.tar.xz

echo "Cloning busybox"
git clone -q --depth 1 --branch 1_39_0 https://git.busybox.net/busybox.git

echo "Copying linux configuration"
cp ~/GreenOS/software/linux/.config ~/GreenOS/linux/.config

echo "Copying busybox configuration"
cp ~/GreenOS/software/busybox/.config ~/GreenOS/busybox/.config
