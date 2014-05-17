
$(call inherit-product, device/qcom/common/common.mk)
$(call inherit-product-if-exists, vendor/motorola/falcon/falcon-vendor.mk)

PRODUCT_DEVICE := falcon
PRODUCT_NAME := falcon
PRODUCT_BRAND := motorola
PRODUCT_MODEL := Moto G
PRODUCT_MANUFACTURER := motorola

# Audio
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# GPS
PRODUCT_PACKAGES += \
    gps.msm8226

# Lights
PRODUCT_PACKAGES += \
    lights.MSM8226

# Wlan
PRODUCT_PACKAGES += \
    wcnss_service \
    pronto_wlan.ko

$(call inherit-product, device/motorola/falcon/prebuilt.mk)
