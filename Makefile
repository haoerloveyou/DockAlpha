TARGET = iphone:clang:latest:9.0
ARCHS = armv7 armv7s arm64 
GO_EASY_ON_ME = 1
DEBUG = 0
export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000

include theos/makefiles/common.mk

TWEAK_NAME = DockAlpha
DockAlpha_FILES = Tweak.xm
DockAlpha_FRAMEWORKS = CoreGraphics QuartzCore UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dockalphaprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
internal-stage::
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -name .DS_Store | xargs rm -rf$(ECHO_END)
