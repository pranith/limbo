#include $(call all-subdir-makefiles)

LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/android-config.mak

# $(1): List of directories to look for under this directory
define all-named-subdir-makefiles
$(wildcard $(addsuffix /Android.mk, $(addprefix $(call my-dir)/,$(1))))
endef

#If you want to build individual modules
#include $(call all-named-subdir-makefiles, png jpeg)
include $(call all-named-subdir-makefiles, glib compat)
#include $(call all-named-subdir-makefiles, openssl spice)

ifeq ($(USE_SDL),true)
    include $(call all-named-subdir-makefiles, SDL SDL_image limbo/sdl_main)
endif

ifeq ($(USE_SDL_AUDIO),true)
    include $(call all-named-subdir-makefiles, SDL_mixer)
endif

include $(call all-named-subdir-makefiles, pixman limbo)
