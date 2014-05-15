
PRODUCT_COPY_FILES += device/motorola/falcon/media/media_profiles_8226.xml:system/etc/media_profiles.xml \
                      device/motorola/falcon/media/media_codecs_8226.xml:system/etc/media_codecs.xml

$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product-if-exists, vendor/motorola/falcon/falcon-vendor.mk)

PRODUCT_DEVICE := falcon
PRODUCT_NAME := falcon
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G
PRODUCT_MANUFACTURER := motorola

PRODUCT_BOOT_JARS += qcmediaplayer:WfdCommon:oem-services:qcom.fmradio:org.codeaurora.Performance:vcard

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/motorola/falcon/audio_policy.conf:system/etc/audio_policy.conf \
    device/motorola/falcon/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/motorola/falcon/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom
#wlan driver
PRODUCT_COPY_FILES += \
    device/motorola/falcon/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/motorola/falcon/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += wcnss_service \
		    pronto_wlan.ko

#ANT stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
        frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_COPY_FILES += \
    device/motorola/falcon/whitelist_appops.xml:system/etc/whitelist_appops.xml
