Device configuration to build [Firefox OS for Moto G](http://www.modaco.com/topic/372487-Firefox-OS/).

How to build:
-------------

Initialize B2G build environment:

    repo init -u git://codeaurora.org/quic/lf/manifest.git -b release -m LNX.LF.3.5.1-03500-8x10.0.xml
    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.githubusercontent.com/B2G-CAF/android_local_manifest/b2g_kk_3.5/local_manifest.xml
    curl -L -o .repo/local_manifests/manifest_motorola_falcon.xml -O -L https://raw.githubusercontent.com/B2G-CAF/android_local_manifest/b2g_kk_3.5/manifest_motorola_falcon.xml
    repo sync

Compile:

    . build/envsetup.sh
    lunch falcon-userdebug
    make
