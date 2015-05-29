LOCAL_PATH := $(call my-dir)

# init
TARGET_PIE := false
NDK_APP_PIE := false

include $(CLEAR_VARS)

# PIE (Position-independent executable) options for Android 5 or higher.
# Android 4.1 - 4.4 supports both PIE and non-PIE.
# Note: Disable following 2 lines for Android 4.0 or below. PIE causes segfault!
#LOCAL_CFLAGS += -fPIE
#LOCAL_LDFLAGS += -fPIE -pie

LOCAL_MODULE    := hello
LOCAL_SRC_FILES := hello.c

LOCAL_LDLIBS += -ldl

include $(BUILD_EXECUTABLE)
