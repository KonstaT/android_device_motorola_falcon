$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := msm8226
PRODUCT_DEVICE := msm8226

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/audio_policy.conf:system/etc/audio_policy.conf \

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
	device/qcom/msm8226/snd_soc_msm/snd_soc_msm_Tapan:system/etc/snd_soc_msm/snd_soc_msm_Tapan \

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom
#wlan driver
PRODUCT_COPY_FILES += \
    device/qcom/msm8226/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/qcom/msm8226/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/msm8226/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin
