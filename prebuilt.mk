# Ramdisk
PRODUCT_COPY_FILES := \
    $(call find-copy-subdir-files,*,device/motorola/falcon/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/falcon/prebuilt/system,system)
