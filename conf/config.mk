#
# Automatically generated file. Don't edit
#
_CONFIG_MK_=1
ARCH=arm
PLATFORM=nds
PROFILE=nds
_GNUC_=1
CC=arm-eabi-gcc
CPP=arm-eabi-cpp
AS=arm-eabi-as
LD=arm-eabi-ld
AR=arm-eabi-ar
OBJCOPY=arm-eabi-objcopy
OBJDUMP=arm-eabi-objdump
STRIP=arm-eabi-strip
PATH := $(DEVKITARM)/bin:$(PATH)
CFLAGS+= -march=armv5te -mtune=arm946e-s -mno-thumb
DEBUG=1
ACPPFLAGS += -O0 -g
CFLAGS    += -O0 -g -DDEBUG
CFLAGS    += -DDEBUG_BOOTINFO
CONFIG_LOADER_TEXT=0x02000000
CONFIG_BOOTIMG_BASE=0x02002000
CONFIG_KERNEL_TEXT=0x02100000
CONFIG_SYSPAGE_BASE=0x0b000000
CONFIG_HZ=200
CONFIG_TIME_SLICE=50
CONFIG_OPEN_MAX=16
CONFIG_BUF_CACHE=32
CONFIG_FS_THREADS=4
CONFIG_ARM926E_S=y
CONFIG_CACHE=y
CONFIG_POSIX=y
CONFIG_CMDBOX=y
CONFIG_TINY=y
CONFIG_KD=y
CONFIG_DIAG_DESMUME=y
CONFIG_DEVFS=y
CONFIG_RAMFS=y
CONFIG_ARFS=y
CONFIG_CONS=y
CONFIG_WSCONS=y
CONFIG_LCD=y
CONFIG_NULL=y
CONFIG_ZERO=y
CONFIG_RAMDISK=y
CONFIG_CMD_CAT=y
CONFIG_CMD_CLEAR=y
CONFIG_CMD_CP=y
CONFIG_CMD_DATE=y
CONFIG_CMD_DMESG=y
CONFIG_CMD_ECHO=y
CONFIG_CMD_FREE=y
CONFIG_CMD_HEAD=y
CONFIG_CMD_HOSTNAME=y
CONFIG_CMD_KILL=y
CONFIG_CMD_LS=y
CONFIG_CMD_MKDIR=y
CONFIG_CMD_MORE=y
CONFIG_CMD_MV=y
CONFIG_CMD_NICE=y
CONFIG_CMD_PRINTENV=y
CONFIG_CMD_PS=y
CONFIG_CMD_PWD=y
CONFIG_CMD_RM=y
CONFIG_CMD_RMDIR=y
CONFIG_CMD_SH=y
CONFIG_CMD_SLEEP=y
CONFIG_CMD_SYNC=y
CONFIG_CMD_TOUCH=y
CONFIG_CMD_UNAME=y
CONFIG_CMD_DISKUTIL=y
CONFIG_CMD_INSTALL=y
CONFIG_CMD_PMCTRL=y
CONFIG_CMD_KTRACE=y
CONFIG_CMD_LOCK=y
CONFIG_CMD_DEBUG=y
