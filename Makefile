# TARGET #

TARGET := 3DS
LIBRARY := 0

ifeq ($(TARGET),3DS)
    ifeq ($(strip $(DEVKITPRO)),)
        $(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro")
    endif

    ifeq ($(strip $(DEVKITARM)),)
        $(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
    endif
endif

# COMMON CONFIGURATION #

NAME := 3DeMore

BUILD_DIR := build
OUTPUT_DIR := output
INCLUDE_DIRS := include
SOURCE_DIRS := source

LIBRARY_DIRS := $(DEVKITPRO)/libctru
LIBRARIES := ctru m

BUILD_FLAGS := -DVERSION_STRING="\"`git describe --tags --abbrev=0`\"" -DREVISION_STRING="\"`git rev-parse --short HEAD``git diff-index --quiet HEAD -- || echo ' (dirty)'`\""

# 3DS CONFIGURATION #

TITLE := $(NAME)
DESCRIPTION := Reset demo use counter
AUTHOR := Kyraminol
PRODUCT_CODE := CTR-K-DEMORST
UNIQUE_ID := 0x1D404

SYSTEM_MODE := 64MB
SYSTEM_MODE_EXT := Legacy

ROMFS_DIR := romfs
BANNER_AUDIO := audio.wav
BANNER_IMAGE := banner.png
ICON := icon.png

# INTERNAL #

include buildtools/make_base
