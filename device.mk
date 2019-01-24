#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEV_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

PRODUCT_AAPT_CONFIG += xlarge large
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536
TARGET_TEGRA_VERSION := t124

$(call inherit-product-if-exists, vendor/nvidia/shield/mocha.mk)

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_F2FS := true
PRODUCT_CHARACTERISTICS := tablet

# HIDL HALs
$(call inherit-product, $(DEV_DIR)/hidl.mk)

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck fsck.f2fs mkfs.f2fs

# Log
PRODUCT_PACKAGES += \
    dmesgLogging

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEV_DIR)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:system/etc/permissions/android.software.freeform_window_management.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.tn8 \
    init.tn8.rc \
    ueventd.tn8.rc

# Wifi
PRODUCT_COPY_FILES += \
    $(DEV_DIR)/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(DEV_DIR)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

LOCAL_OVERRIDES_PACKAGES := Bluetooth libbluetooth_jni

BOARD_USES_LIBDRM := true
USE_DRM_HWCOMPOSER := true

ENABLE_LIBDRM := true
BOARD_GPU_DRIVERS ?= tegra nouveau
BOARD_DRM_HWCOMPOSER_BUFFER_IMPORTER := minigbm
PRODUCT_PACKAGES += \
    hwcomposer.drm \
    gralloc.minigbm \
    libGLES_mesa
