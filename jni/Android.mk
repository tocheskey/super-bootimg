my_path := $(call my-dir)

LOCAL_PATH := $(my_path)

include $(CLEAR_VARS)
LOCAL_MODULE := bootimg-extract
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_LDFLAGS := -static
LOCAL_STATIC_LIBRARIES := libc libcutils libbootimg
LOCAL_C_INCLUDES := jni/include/
LOCAL_SRC_FILES := extract.c
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := bootimg-repack
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_LDFLAGS := -static
LOCAL_STATIC_LIBRARIES := libc libcutils
LOCAL_SRC_FILES := repack.c
include $(BUILD_EXECUTABLE)

#include $(CLEAR_VARS)
#LOCAL_MODULE := strip-cpio
#LOCAL_MODULE_TAGS := optional
#LOCAL_FORCE_STATIC_EXECUTABLE := true
#LOCAL_LDFLAGS := -static
#LOCAL_STATIC_LIBRARIES := libc libcutils
#LOCAL_SRC_FILES := strip-cpio.c
#LOCAL_CFLAGS += -std=gnu11
#include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := sepolicy-inject
LOCAL_MODULE_TAGS := optional
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_LDFLAGS := -static
LOCAL_STATIC_LIBRARIES := libc libcutils libsepol libselinux
LOCAL_SRC_FILES := sepolicy-inject/sepolicy-inject.c
LOCAL_C_INCLUDES := jni/libselinux/include/ jni/libsepol/include/
LOCAL_CFLAGS += -std=gnu11
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE := libbootimg
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := jni/include/
LOCAL_COPY_HEADERS := include/libbootimg.h
LOCAL_SRC_FILES := lib-parse.c
include $(BUILD_SHARED_LIBRARY)

include $(my_path)/libselinux/Android.mk
include $(my_path)/libsepol/Android.mk
