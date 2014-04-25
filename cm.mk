# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/falcon/falcon.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := falcon
PRODUCT_NAME := cm_falcon
PRODUCT_BRAND := motorola
PRODUCT_MODEL := falcon
PRODUCT_MANUFACTURER := motorola
PRODUCT_RELEASE_NAME := MOTO G

PRODUCT_GMS_CLIENTID_BASE := android-motorola
