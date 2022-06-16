TARGET := iphone:clang:latest:7.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Youtubed

Youtubed_FILES = Tweak.x
Youtubed_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
