Device configuration to build [Firefox OS for Moto G](http://www.modaco.com/topic/372487-Firefox-OS/).

How to build:
-------------

Initialize B2G build environment:

    repo init -u git://codeaurora.org/quic/lf/manifest.git -b release -m LNX.LF.3.5-10600-8x26.0.xml
    curl --create-dirs -L -o .repo/local_manifests/manifest_motorola_falcon.xml -O -L https://raw.githubusercontent.com/KonstaT/android_device_motorola_falcon/b2g_kk_3.5/patches/manifest_motorola_falcon.xml
    repo sync

Compile:

    . build/envsetup.sh
    lunch falcon-userdebug
    make
