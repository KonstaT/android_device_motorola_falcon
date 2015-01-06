CyanogenMod 12 device configuration for [Motorola Moto G](http://www.modaco.com/topic/374265-cyanogenmod-12/).

How to build:
-------------

Initialize repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-12.0
    curl --create-dirs -L -o .repo/local_manifests/manifest_motorola_falcon.xml -O -L https://raw.githubusercontent.com/legaCyMod/android_local_manifest/cm-12.0/manifest_motorola_falcon.xml
    repo sync

Compile:

    . build/envsetup.sh
    brunch falcon
