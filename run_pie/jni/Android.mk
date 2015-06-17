LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := run_pie
LOCAL_SRC_FILES := run_pie.c

LOCAL_LDLIBS += -ldl

include $(BUILD_EXECUTABLE)
