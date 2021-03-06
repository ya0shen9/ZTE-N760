# Inherit AOSP device configuration for n760.
$(call inherit-product, device/zte/Tn760/device_roamer.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_Tn760
PRODUCT_BRAND := zte
PRODUCT_DEVICE := Tn760
PRODUCT_MODEL := Roamer
PRODUCT_MANUFACTURER := ZTE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=roamer BUILD_ID=GWK74 BUILD_FINGERPRINT=google/passion/passion:2.3.7/GWK74/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.7 GWK74 121341 release-keys"

# Release name and versioning
PRODUCT_RELEASE_NAME := N760
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy  specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
