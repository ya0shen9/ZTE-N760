# by ioz9 @lewa

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_as_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/Tn760/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_roamer
PRODUCT_DEVICE := roamer
PRODUCT_MODEL := ZTE Roamer
#PRODUCT_LOCALES := zh_CN zh_TW en_US
PRODUCT_LOCALES := zh_CN en_US

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \
    copybit.roamer \
    gralloc.roamer \
    lights.roamer \
    libOmxVidEnc \
    abtfilt \
    dexpreopt \
    LeWaFM

#liuhao removed, use PicFolder.apk 
#    Gallery3D \

#    LiveWallpapers \
#    LiveWallpapersPicker \
#    VisualizationWallpapers \
#    MagicSmokeWallpapers \
#    VisualizationWallpapers \
#    Term \
    
# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/Tn760/roamer-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/Tn760/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/zte/Tn760/prebuilt/usr/keylayout/roamer_keypad.kl:system/usr/keylayout/roamer_keypad.kl \
    device/zte/Tn760/prebuilt/usr/keychars/roamer_keypad.kcm.bin:system/usr/keychars/roamer_keypad.kcm.bin

# Vold
PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# apns-conf.xml
#PRODUCT_COPY_FILES += \
#    device/common/apn/apns-conf.xml:system/etc/apns-conf.xml


# ril
PRODUCT_COPY_FILES += \
    vendor/zte/Tn760/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so \
    vendor/zte/Tn760/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/zte/Tn760/proprietary/lib/libril.so:obj/lib/libril.so \
    vendor/zte/Tn760/proprietary/lib/libreference-cdma-sms.so:system/lib/libreference-cdma-sms.so

# Init
PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/init.roamer.rc:root/init.roamer.rc \
    device/zte/Tn760/prebuilt/ueventd.roamer.rc:root/ueventd.roamer.rc \
    device/zte/Tn760/prebuilt/usbconfig:root/sbin/usbconfig \
    device/zte/Tn760/prebuilt/so_scsi_command:root/sbin/so_scsi_command 

# Audio
PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT + FM
PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/etc/init.bt.sh:system/etc/init.bt.sh \
    device/zte/Tn760/prebuilt/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/zte/Tn760/prebuilt/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
    device/zte/Tn760/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/zte/Tn760/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/Tn760/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/zte/Tn760/prebuilt/lib/modules/2.6.35.7-pref+/zram.ko:system/lib/modules/2.6.35.7-pref+/zram.ko 

# WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/Tn760/prebuilt/etc/fw_4319.bin:system/etc/fw_4319.bin \
    device/zte/Tn760/prebuilt/etc/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    device/zte/Tn760/prebuilt/etc/nv_4319.txt:system/etc/nv_4319.txt \
    device/zte/Tn760/prebuilt/etc/fw_4329.bin:system/etc/fw_4329.bin \
    device/zte/Tn760/prebuilt/etc/fw_4329_apsta.bin:system/etc/fw_4329_apsta.bin \
    device/zte/Tn760/prebuilt/etc/nv_4329.txt:system/etc/nv_4329.txt

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 

# Fix RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.baseband_version=N760B01 \
    wifi.supplicant_scan_interval=120 \
    ro.com.android.dataroaming=false

# roamer uses high-density artwork where available
PRODUCT_LOCALES += mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    qemu.sf.lcd_density=160 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.cdma.home.operator.numeric=46003 \
    ro.telephony.default_network=4 \
    ro.cdma.home.operator.alpha=中国电信 \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.voicemail.number=*86 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lewa.swapper.part_path=/dev/block/mmcblk0p3

# ioz9 Fix APGS support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.def.agps.mode=2

# copy default lockscreen theme by shenqi 2011-12-29
#PRODUCT_COPY_FILES += \
#    lewa/frameworks/lockscreen/HVGA/lockscreen.zip:/system/media/lockscreen.zip \
#    lewa/frameworks/theme/HVGA/default.lwt:/system/media/default.lwt

# added by ioz9 2012-03-03
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_wakeupkey=3 \
    ro.config.hw_menu_unlockscreen=true \
    ro.camera.intrplt.2mpto3mp=true

# Perfomance tweaks by ioz9
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.sf.hwrotation=180 \
    debug.sf.hw=1 \
    windowsmgr.max_events_per_sec=120 \
    video.accelerate.hw=1 \
    debug.composition.type=gpu \
    debug.performance.tuning=1
