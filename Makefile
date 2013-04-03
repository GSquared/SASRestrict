export TARGET=:clang
include theos/makefiles/common.mk

TWEAK_NAME = SASRestrict
SASRestrict_FILES = Tweak.xm
SASRestrict_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
