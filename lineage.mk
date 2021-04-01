# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from klimtwifi device
$(call inherit-product, device/samsung/klimtwifi/device.mk)

PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung

# Inherit some common lineage stuff
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_klimtwifi
PRODUCT_DEVICE := klimtwifi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_MODEL=SM-T700 \
    PRODUCT_NAME=klimtwifi \
    PRODUCT_DEVICE=klimtwifi \
    PRIVATE_BUILD_DESC="samsung/klimtwifixx/klimtwifi:6.0.1/MMB29K/T700XXU1CRF1:user/release-keys" \
    TARGET_DEVICE=klimtwifi

BUILD_FINGERPRINT := samsung/klimtwifixx/klimtwifi:6.0.1/MMB29K/T700XXU1CRF1:user/release-keys
