# Copyright (C) 2009 The Android Open Source Project
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


# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Stuff Common for all HTC Devices
$(call inherit-product, device/htc/common/common.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay
PRODUCT_LOCALES += mdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/pico/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Indcluded Packages
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    libmm-omxcore \
    libOmxCore \
    libOmxVidEnc \
    LiveWallpapers \
    LiveWallpapersPicker \
    dexpreopt \
 
# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \

# Board-specific init
PRODUCT_COPY_FILES += \
    device/htc/pico/files/init.pico.rc:root/init.pico.rc \
    device/htc/pico/files/ueventd.rc:root/ueventd.rc \
 
# Some build properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r8 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.telephony.call_ring.multiple=false \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    persist.telephony.support_ipv6=true \
    persist.telephony.support_ipv4=true \
  
# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/libcamera.so:obj/lib/libcamera.so \

# Prebuilt Binaries
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/bin/awb_camera:system/bin/awb_camera \
    vendor/htc/pico/proprietary/bin/bma150_usr:system/bin/bma150_usr \
    vendor/htc/pico/proprietary/bin/btld:system/bin/btld \
    vendor/htc/pico/proprietary/bin/cam_ins_spmo:system/bin/cam_ins_spmo \
    vendor/htc/pico/proprietary/bin/charging:system/bin/charging \
    vendor/htc/pico/proprietary/bin/htc_ebdlogd:system/bin/htc_ebdlogd \
    vendor/htc/pico/proprietary/bin/htcfs:system/bin/htcfs \
    vendor/htc/pico/proprietary/bin/ipd:system/bin/ipd \
    vendor/htc/pico/proprietary/bin/logcat2:system/bin/logcat2 \
    vendor/htc/pico/proprietary/bin/lsc_camera:system/bin/lsc_camera \
    vendor/htc/pico/proprietary/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
    vendor/htc/pico/proprietary/bin/mm-qcamera-testsuite-client-awb:system/bin/mm-qcamera-testsuite-client-awb \
    vendor/htc/pico/proprietary/bin/netsharing:system/bin/netsharing \
    vendor/htc/pico/proprietary/bin/rild:system/bin/rild \
    vendor/htc/pico/proprietary/bin/ser2net:system/bin/ser2net \
    vendor/htc/pico/proprietary/bin/snd:system/bin/snd \
    vendor/htc/pico/proprietary/bin/snd8k:system/bin/snd8k \
    vendor/htc/pico/proprietary/bin/tc:system/bin/tc \
    vendor/htc/pico/proprietary/bin/tund:system/bin/tund \
    vendor/htc/pico/proprietary/bin/udhcpd:system/bin/udhcpd\
    vendor/htc/pico/proprietary/bin/wireless_modem:system/xbin/wireless_modem \
    vendor/htc/pico/proprietary/bin/zchgd:system/bin/zchgd \

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/bcm4330.ko:system/lib/modules/bcm4330.ko \
    device/htc/pico/prebuilt/kineto_gan.ko:system/lib/modules/kineto_gan.ko 
    device/htc/pico/prebuilt/cifs.ko:system/lib/modules/cifs.ko \

# Wifi
PRODUCT_COPY_FILES += \
    device/htc/pico/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/pico/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330.bin:system/etc/firmware/fw_bcm4330.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330_apsta.bin:system/etc/firmware/fw_bcm4330_apsta.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330b2.bin:system/etc/firmware/fw_bcm4330b2.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcm4330b2_apsta.bin:system/etc/firmware/fw_bcm4330b2_apsta.bin \
    vendor/htc/pico/proprietary/etc/iproute2/rt_tables:system/etc/iproute2/rt_tables \
    
# SD Card
PRODUCT_COPY_FILES += \
    device/htc/pico/files/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/htc/pico/files/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/pico/prebuilt/etc/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/pico/prebuilt/etc/AudioPara4.csv:system/etc/AudioPara4.csv \
    device/htc/pico/prebuilt/etc/AudioPara4_WB.csv:system/etc/AudioPara4_WB.csv \
    device/htc/pico/prebuilt/etc/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    vendor/htc/pico/proprietary/lib/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    vendor/htc/pico/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
    
# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Sensors
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/hw/sensors.pico.so:system/lib/hw/sensors.pico.so \
    vendor/htc/pico/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    
# GPS
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/hw/gps.pico.so:system/lib/hw/gps.pico.so \
    vendor/htc/pico/proprietary/lib/libloc_api-rpc.so:system/lib/libloc_api-rpc.so \

# 3D
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    vendor/htc/pico/proprietary/lib/hw/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so \
    vendor/htc/pico/proprietary/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    vendor/htc/pico/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/htc/pico/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/htc/pico/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/htc/pico/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/htc/pico/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/htc/pico/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    vendor/htc/pico/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/htc/pico/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/libcamera.so:system/lib/libcamera.so \
    vendor/htc/pico/proprietary/lib/libcameraservice.so:system/lib/libcameraservice.so \
    vendor/htc/pico/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/htc/pico/proprietary/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/htc/pico/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/htc/pico/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/htc/pico/proprietary/lib/libcameraface.so:system/lib/libcameraface.so \
    vendor/htc/pico/proprietary/lib/libcamerapp.so:system/lib/libcamerapp.so \
    vendor/htc/pico/proprietary/lib/libcapsjava.so:system/lib/libcapsjava.so \
    vendor/htc/pico/proprietary/lib/libscaladoapi.so:system/lib/libscaladoapi.so \
    vendor/htc/pico/proprietary/lib/libscaladoutil.so:system/lib/libscaladoutil.so \
    vendor/htc/pico/proprietary/lib/libOlaEngine.so:system/lib/libOlaEngine.so \
   
    
# RIL
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/libril.so:system/lib/libril.so \
    vendor/htc/pico/proprietary/lib/libril_status.so:system/lib/libril_status.so \
    vendor/htc/pico/proprietary/lib/libhtc_ril.so:system/lib/libhtc_ril.so \
    vendor/htc/pico/proprietary/lib/libhtc_ril_switch.so:system/lib/libhtc_ril_switch.so \
    vendor/htc/pico/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so \
    vendor/htc/pico/proprietary/lib/libreference-cdma-sms.so:system/lib/libreference-cdma-sms.so \


#CHROMATIX
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/libchromatix_mt9t013_default_video.so:system/lib/libchromatix_mt9t013_default_video.so \
    vendor/htc/pico/proprietary/lib/libchromatix_mt9t013_preview.so:system/lib/libchromatix_mt9t013_preview.so \

# OMX & MISC.
PRODUCT_COPY_FILES += \
    vendor/htc/pico/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/htc/pico/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/htc/pico/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/htc/pico/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/htc/pico/proprietary/lib/liboma-drm1-fs.so:system/lib/liboma-drm1-fs.so \
    vendor/htc/pico/proprietary/lib/libfuse.so:system/lib/libfuse.so \
    vendor/htc/pico/proprietary/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \
    device/htc/pico/prebuilt/etc/init.d/93zram:system/etc/init.d/93zram \
    device/htc/pico/prebuilt/compcache:system/bin/compcache \
    device/htc/pico/prebuilt/handle_compcache:system/bin/handle_compcache \
    device/htc/pico/prebuilt/zram_stats:system/bin/zram_stats \
    vendor/htc/pico/proprietary/etc/gps.conf:system/etc \
    vendor/htc/pico/proprietary/etc/spn-conf.xml:system/etc \
    device/htc/pico/prebuilt/lib/libhciutils.so:system/lib/libhciutils.so \
#    vendor/htc/pico/proprietary/lib/libwsp.so:system/lib/libwsp.so \
#   
#    vendor/htc/pico/proprietary/lib/libwsp_jni.so:system/lib/libwsp_jni.so \
#    vendor/htc/pico/proprietary/lib/libwebkitaccel.so:system/lib/libwebkitaccel.so \
#    vendor/htc/pico/proprietary/lib/libOpenVG.so:system/lib/libOpenVG.so \
#    vendor/htc/pico/proprietary/lib/libext2_blkid.so:system/lib/libext2_blkid.so \
#    vendor/htc/pico/proprietary/lib/libext2_com_err.so:system/lib/libext2_com_err.so \
#    vendor/htc/pico/proprietary/lib/libext2_e2p.so:system/lib/libext2_e2p.so \
#    vendor/htc/pico/proprietary/lib/libext2fs.so:system/lib/libext2fs.so \
#    vendor/htc/pico/proprietary/lib/libext2_profile.so:system/lib/libext2_profile.so \
#    vendor/htc/pico/proprietary/lib/libext2_uuid.so:system/lib/libext2_uuid.so \

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/pico/prebuilt/etc/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \

# Bluetooth
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh \
    vendor/htc/pico/proprietary/etc/firmware/BCM4330B1_002.001.003.0221.0228.hcd:system/etc/firmware/BCM4330B1_002.001.003.0221.0228.hcd \

    
# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/pico/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/pico/prebuilt/usr/keychars/pico-keypad.kcm.bin:system/usr/keychars/pico-keypad.kcm.bin \
    device/htc/pico/prebuilt/usr/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/pico/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/pico/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/pico/prebuilt/usr/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/pico/prebuilt/usr/keylayout/pico-keypad.kl:system/usr/keylayout/pico-keypad.kl
    device/htc/pico/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
