THEOS_DEVICE_IP = 192.168.1.63
# THEOS_DEVICE_IP=local

TARGET = iphone:clang:11.2:11.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CustomControlCentre
CustomControlCentre_FILES = CustomControlCentre.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += customcontrolcentrepref
include $(THEOS_MAKE_PATH)/aggregate.mk
