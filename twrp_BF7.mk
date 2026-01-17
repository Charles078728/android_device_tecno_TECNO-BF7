
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Add this line if your device is 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
# Otherwise, If you have 32-bit device, add the below line instead of above line
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Inherit from main device makefile, if had any. Otherwise, ignore.
$(call inherit-product, device/tecno/BF7/device.mk)

# If your device is treble compatible (64-bit), add below line
$(call inherit-product, $(SRC_TARGET_DIR)/product/treble_common_64.mk)

# For some dalvik improvement, better to keep it
$(call inherit-product, $(SRC_TARGET_DIR)/product/runtime_libart.mk)

# If you want full multilingual support
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from PitchBlack Recovery's custom product configuration instead of OmniROM's
# Delete any line that imports OmniROM's vendor config
$(call inherit-product, vendor/twrp/config/common.mk)

# Now add device specific BRAND, MODEL, BOARD, Props, etc. if needed.
# Set those variables here to overwrite the inherited values.
PRODUCT_BRAND := TECNO
PRODUCT_DEVICE := BF7
PRODUCT_NAME := twrp_BF7
PRODUCT_MANUFACTURER := Tecno
PRODUCT_MODEL := TECNO BF7

PRODUCT_GMS_CLIENTID_BASE := android-tecno

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_bf7_h6127-user 12 SP1A.210812.016 651674 release-keys"

BUILD_FINGERPRINT := TECNO/BF7/TECNO-BF7:12/SP1A.210812.016/240703V1812:user/release-keys
