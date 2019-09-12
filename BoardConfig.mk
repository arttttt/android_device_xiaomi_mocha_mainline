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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk

DEV_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

TARGET_SPECIFIC_HEADER_PATH := $(DEV_DIR)/include
DEVICE_MANIFEST_FILE += $(DEV_DIR)/manifest.xml
BOARD_SEPOLICY_DIRS += $(DEV_DIR)/sepolicy

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15

# Binder API
TARGET_USES_64_BIT_BINDER := true

BOARD_HAVE_BLUETOOTH := false

# Board
TARGET_BOARD_PLATFORM := tegra
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_TEGRA_VARIANT := shield

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536
TARGET_BOOTANIMATION_HALF_RES := true

# FS
TARGET_EXFAT_DRIVER := sdfat

# Init
# TARGET_INIT_VENDOR_LIB := mocha_init
# TARGET_RECOVERY_DEVICE_MODULES := mocha_init

# Kernel
BOARD_KERNEL_CMDLINE := vpr_resize androidboot.selinux=permissive androidboot.hardware=tn8
BOARD_KERNEL_BASE := 0x10000000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100

#TARGET_KERNEL_SOURCE := kernel/xiaomi/mocha_mainline
#TARGET_KERNEL_CONFIG := mocha_android_defconfig
#KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/gcc-linaro-6.4.1/bin
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-gnueabihf-
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := $(DEV_DIR)/kernel
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --dt $(DEV_DIR)/dt.img
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_CUSTOM_BOOTIMG_MK := $(DEV_DIR)/mkbootimg.mk

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640 # 640 Mb stock partition table
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1337564160 # 1.2 Gb
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13742637056
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_PERSISTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEV_DIR)
TARGET_RECOVERY_FSTAB := $(DEV_DIR)/initfiles/fstab.tn8
BOARD_NO_SECURE_DISCARD := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
#WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/mocha_fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/mocha_fw_bcmdhd_apsta.bin"
#WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
#WIFI_DRIVER_MODULE_NAME          := "bcmdhd"

USE_OPENGL_RENDERER := true
BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true
BOARD_USES_DRM_HWCOMPOSER := true
BOARD_USES_LIBDRM := true
BOARD_USE_MESA := true
