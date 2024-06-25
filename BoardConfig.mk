#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oppo/peym00

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# 机型验证
TARGET_OTA_ASSERT_DEVICE := PEYM00

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k6893v1_64_k419
TARGET_NO_BOOTLOADER := true


# 这两个仅适用于MTK芯片组
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Platform
TARGET_BOARD_PLATFORM := mt6893

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel -- 使用源码编译才使用此部分
# BOARD_BOOTIMG_HEADER_VERSION := 2
# BOARD_KERNEL_BASE := 0x40078000
# BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user
# BOARD_KERNEL_PAGESIZE := 2048
# BOARD_RAMDISK_OFFSET := 0x11088000
# BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
# BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
# BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
# BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
# BOARD_KERNEL_IMAGE_NAME := Image
# BOARD_INCLUDE_DTB_IN_BOOTIMG := true
# BOARD_KERNEL_SEPARATED_DTBO := true
# TARGET_KERNEL_CONFIG := k6893v1_64_k419_defconfig
# TARGET_KERNEL_SOURCE := 

# Kernel - prebuilt 使用预先构建的二进制文件
# 内核
# true/false：确定设备是否为64位
# 从解压缩的恢复映像中获取CMDLine、Base、Pagesize和offsets并在下面填入
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 buildvariant=user androidboot.selinux=permissive
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
# BOARD_INCLUDE_DTB_IN_BOOTIMG := 
# BOARD_KERNEL_SEPARATED_DTBO := 
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := kernel

# FASTAB
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

TARGET_BOARD_SUFFIX := _64                    # 如果设备是32位，则删除此行
TARGET_USES_64_BIT_BINDER := true             # 如果设备是32位，则删除此行

# Metadata
BOARD_USES_METADATA_PARTITION := true
TW_CRYPTO_FS_TYPE := f2fs
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/bootdevice/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "noatime,nosuid,nodev,noauto_da_alloc,discard,errors=panic"
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := oplus_dynamic_partitions
BOARD_OPLUS_DYNAMIC_PARTITIONS_PARTITION_LIST := system system vendor vendor product product odm odm my_product my_product my_engineering my_engineering my_company my_company my_carrier my_carrier my_region my_region my_heytap my_heytap my_stock my_stock my_preload my_preload my_bigball my_bigball
BOARD_OPLUS_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 2048  # 调整默认亮度值
DEVICE_RESOLUTION := 1080X2400  # 确认分辨率配置
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
TW_THEME := portrait_hdpi  # 尝试不同的主题
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone54/temp"
