# Inherit device configuration for mocha.
$(call inherit-product, device/xiaomi/mocha_mainline/full_mocha_mainline.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_tablet_wifionly.mk)

PRODUCT_NAME := lineage_mocha_mainline
PRODUCT_DEVICE := mocha_mainline
BOARD_VENDOR := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
