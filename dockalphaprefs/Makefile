TARGET = iphone:clang:latest:9.0
ARCHS = armv7 armv7s arm64 
GO_EASY_ON_ME = 1
DEBUG = 0
export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000

include theos/makefiles/common.mk

BUNDLE_NAME = DockAlphaPrefs
DockAlphaPrefs_FILES = DockAlphaPrefs.mm
DockAlphaPrefs_INSTALL_PATH = /Library/PreferenceBundles
DockAlphaPrefs_FRAMEWORKS = CoreGraphics QuartzCore UIKit
DockAlphaPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/DockAlphaPrefs.plist$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -name .DS_Store | xargs rm -rf$(ECHO_END)
