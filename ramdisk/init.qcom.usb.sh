#!/system/bin/sh
# Copyright (c) 2012, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
# Update USB serial number from persist storage if present, if not update
# with value passed from kernel command line, if none of these values are
# set then use the default value. This order is needed as for devices which
# do not have unique serial number.
# User needs to set unique usb serial number to persist.usb.serialno
#
serialno=`getprop persist.usb.serialno`
case "$serialno" in
    "")
    serialnum=`getprop ro.serialno`
    case "$serialnum" in
        "");; #Do nothing, use default serial number
        *)
        echo "$serialnum" > /sys/class/android_usb/android0/iSerial
    esac
    ;;
    *)
    echo "$serialno" > /sys/class/android_usb/android0/iSerial
esac

chown -h root.system /sys/devices/platform/msm_hsusb/gadget/wakeup
chmod -h 220 /sys/devices/platform/msm_hsusb/gadget/wakeup

#
# Allow USB enumeration with default PID/VID
#
echo 1  > /sys/class/android_usb/f_mass_storage/lun/nofua
usb_config=`getprop persist.sys.usb.config`
bootmode=`getprop ro.bootmode`
buildtype=`getprop ro.build.type`

case "$bootmode" in
    "bp-tools" )
        if [ "$usb_config" != "diag,serial_smd,serial_tty,rmnet,usbnet,adb" ]
        then
            setprop persist.sys.usb.config diag,serial_smd,serial_tty,rmnet,usbnet,adb
        fi
    ;;
    "factory" )
        allow_adb=`getprop persist.factory.allow_adb`
        case "$allow_adb" in
            "1")
                if [ "$usb_config" != "usbnet,adb" ]
                then
                    setprop persist.sys.usb.config usbnet,adb
                fi
            ;;
            *)
                if [ "$usb_config" != "usbnet" ]
                then
                    setprop persist.sys.usb.config usbnet
                fi
            ;;
        esac
    ;;
    "qcom" )
        if [ "$usb_config" != "diag,serial_smd,serial_tty,rmnet_bam,mass_storage,adb" ]
        then
            setprop persist.sys.usb.config diag,serial_smd,serial_tty,rmnet_bam,mass_storage,adb
        fi
    ;;
    * )
        case "$usb_config" in
            "ptp,adb" | "mtp,adb" | "ptp" | "mtp" )
            ;;
            *)
                case "$buildtype" in
                    "user" )
                        setprop persist.sys.usb.config mtp
                    ;;
                    * )
                        setprop persist.sys.usb.config mtp,adb
                    ;;
                esac
            ;;
        esac
    ;;
esac
