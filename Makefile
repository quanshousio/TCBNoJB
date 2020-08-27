TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = TCB
ARCHS = armv7 arm64 arm64e
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TCBNoJB

TCBNoJB_FILES = Tweak.x
TCBNoJB_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
