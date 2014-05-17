# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(TARGET_ARCH),)
TARGET_ARCH := arm
endif

BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true

TARGET_USES_AOSP := false
# Compile with msm kernel
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_HAS_QC_KERNEL_SOURCE := true

-include $(QCPATH)/common/msm8226/BoardConfigVendor.mk

ifndef $(QCPATH)
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_HARDWARE := true
BOARD_HAVE_BLUETOOTH := true
BOARD_USES_ALSA_AUDIO := true
USE_OPENGL_RENDERER := true
TARGET_USES_QCOM_MM_AUDIO := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

TARGET_USES_C2D_COMPOSITION := true
DOLBY_DAP := true
DOLBY_UDC := true

ifeq ($(BOARD_HAVE_BLUETOOTH), true)
   BOARD_HAVE_BLUETOOTH_BLUEZ := false
ifneq ($(BOARD_HAVE_BLUETOOTH_BLUEZ), true)
   BOARD_HAVE_BLUETOOTH_QCOM := true
   QCOM_BT_USE_SMD_TTY := true
endif # BOARD_HAVE_BLUETOOTH_BLUEZ
endif # BOARD_HAVE_BLUETOOTH

endif #QCPATH

#TODO: Fix-me: Setting TARGET_HAVE_HDMI_OUT to false
# to get rid of compilation error.
TARGET_HAVE_HDMI_OUT := false
TARGET_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

#TARGET_BOOTIMG_SIGNED := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Kernel
KERNEL_DEFCONFIG := msm8226_caf_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.write_protect=0 zcache androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x02000000

BOARD_EGL_CFG := device/motorola/falcon/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1023410176
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13870432256
BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 73400320
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

TARGET_USES_ION := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_msm

#Add support for firmare upgrade on 8226
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true

# SELinux
BOARD_SEPOLICY_DIRS := \
    device/motorola/falcon/sepolicy \
    device/qcom/common/sepolicy

BOARD_SEPOLICY_UNION := \
    fs_use \
    netd.te

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))
