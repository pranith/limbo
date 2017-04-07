# This file is the top android makefile for all sub-modules.

LOCAL_PATH := $(call my-dir)

GLIB_TOP := $(LOCAL_PATH)

GLIB_BUILD_STATIC := $(BUILD_STATIC)

GLIB_C_INCLUDES :=			\
	$(GLIB_TOP)			\
	$(GLIB_TOP)/glib		\
	$(GLIB_TOP)/android

GTHREAD_C_INCLUDES :=			\
	$(GLIB_C_INCLUDES)		\
	$(GLIB_TOP)/gthread

GOBJECT_C_INCLUDES :=			\
	$(GLIB_C_INCLUDES)		\
	$(GLIB_TOP)/gobject		\
	$(GLIB_TOP)/gobject/android

GMODULE_C_INCLUDES :=			\
	$(GLIB_C_INCLUDES)		\
	$(GLIB_TOP)/gmodule

GIO_C_INCLUDES :=			\
	$(GLIB_C_INCLUDES)		\
	$(GLIB_TOP)/gio			\
	$(GLIB_TOP)/gio/android

GLIB_SHARED_LIBRARIES :=		\
	libgmodule-2.0			\
	libgobject-2.0			\
	libgthread-2.0			\
	libglib-2.0

GLIB_STATIC_LIBRARIES :=		\
	$(GLIB_SHARED_LIBRARIES)	\
	libpcre

include $(CLEAR_VARS)

include $(call all-named-subdir-makefiles, glib gthread gobject gmodule)
#include $(call all-named-subdir-makefiles, gio tests)
