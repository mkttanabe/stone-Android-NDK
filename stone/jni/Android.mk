LOCAL_PATH := $(call my-dir)

# init
TARGET_PIE := false
NDK_APP_PIE := false

# copy *.so to lib/<arch>/
include $(CLEAR_VARS)
LOCAL_MODULE	:= libcrypto
LOCAL_SRC_FILES	:= libcrypto.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= libssl
LOCAL_SRC_FILES	:= libssl.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE	:= libcutils
LOCAL_SRC_FILES	:= libcutils.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

# workaround for ndk-10d defaul linker's bug
# https://code.google.com/p/android/issues/detail?id=109071
LOCAL_LDFLAGS   += -fuse-ld=bfd

# PIE (Position-independent executable) options for Android 5 or higher.
# Android 4.1 - 4.4 supports both PIE and non-PIE.
# Note: Disable following 2 lines for Android 4.0 or below. PIE causes segfault!
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie

LOCAL_MODULE    := stone
LOCAL_SRC_FILES := stone_ndk.c

LOCAL_C_INCLUDES := \
	./jni/regex \
	./jni/openssl/include

LOCAL_LDLIBS += -ldl
#LOCAL_LDLIBS += -llog

LOCAL_SHARED_LIBRARIES := \
	libcrypto \
	libssl \
	libcutils

include $(BUILD_EXECUTABLE)
