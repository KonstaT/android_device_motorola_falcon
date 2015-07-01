#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),falcon)
include $(call all-makefiles-under,$(LOCAL_PATH))

# Symlinks
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9306; \
    rm $(TARGET_OUT_ETC)/firmware/wcd9306/wcd9306_anc.bin; \
    rm $(TARGET_OUT_ETC)/firmware/wcd9306/wcd9306_mbhc.bin; \
    ln -sf /data/misc/audio/wcd9320_anc.bin \
    $(TARGET_OUT_ETC)/firmware/wcd9306/wcd9306_anc.bin; \
    ln -sf /data/misc/audio/mbhc.bin \
    $(TARGET_OUT_ETC)/firmware/wcd9306/wcd9306_mbhc.bin)

$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
    rm $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin; \
    ln -sf /persist/WCNSS_qcom_wlan_factory_nv.bin \
    $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_factory_nv.bin)
endif
