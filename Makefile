INSTALL_TARGET_PROCESSES = SpringBoard

DEBUG=0
TARGET = :::8.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = appdoc

appdoc_FILES = Tweak.x
appdoc_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
