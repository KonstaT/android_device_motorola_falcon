# Symlinks
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
        rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin; \
        ln -sf /persist/WCNSS_qcom_wlan_factory_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin)
