#encoder int test
OLD_LOCAL_PATH := $(LOCAL_PATH)
MM_JPEG_TEST_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_PATH := $(MM_JPEG_TEST_PATH)
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -DCAMERA_ION_HEAP_ID=ION_IOMMU_HEAP_ID
LOCAL_CFLAGS += -Wall -Wextra -Werror -Wno-unused-parameter
LOCAL_CFLAGS += -D_ANDROID_

ifeq ($(strip $(TARGET_USES_ION)),true)
LOCAL_CFLAGS += -DUSE_ION
endif

JPEG_PIPELINE_TARGET_LIST := msm8994
JPEG_PIPELINE_TARGET_LIST += msm8992
JPEG_PIPELINE_TARGET_LIST += msm8996
JPEG_PIPELINE_TARGET_LIST += apq8098_latv
JPEG_PIPELINE_TARGET_LIST += msm8998

ifneq (,$(filter  $(JPEG_PIPELINE_TARGET_LIST),$(TARGET_BOARD_PLATFORM)))
    LOCAL_CFLAGS+= -DMM_JPEG_USE_PIPELINE
endif

# System header file path prefix
LOCAL_CFLAGS += -DSYSTEM_HEADER_PREFIX=sys

OMX_CORE_DIR := $(MM_JPEG_TEST_PATH)/../../../../mm-image-codec

LOCAL_C_INCLUDES := $(MM_JPEG_TEST_PATH)
LOCAL_C_INCLUDES += $(MM_JPEG_TEST_PATH)/../inc
LOCAL_C_INCLUDES += $(MM_JPEG_TEST_PATH)/../../common
LOCAL_C_INCLUDES += $(MM_JPEG_TEST_PATH)/../../mm-camera-interface/inc
LOCAL_C_INCLUDES += $(OMX_CORE_DIR)/qexif
LOCAL_C_INCLUDES += $(OMX_CORE_DIR)/qomx_core

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_HEADER_LIBRARIES += media_plugin_headers
LOCAL_SRC_FILES := mm_jpeg_test.c

LOCAL_32_BIT_ONLY := $(BOARD_QTI_CAMERA_32BIT_ONLY)
LOCAL_MODULE           := mm-jpeg-interface-test
LOCAL_VENDOR_MODULE := true
include $(SDCLANG_COMMON_DEFS)
LOCAL_PRELINK_MODULE   := false
LOCAL_SHARED_LIBRARIES := libcutils libdl liblog libmmjpeg_interface

include $(BUILD_EXECUTABLE)



#decoder int test

include $(CLEAR_VARS)
LOCAL_PATH := $(MM_JPEG_TEST_PATH)
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := -DCAMERA_ION_HEAP_ID=ION_IOMMU_HEAP_ID
LOCAL_CFLAGS += -Wall -Wextra -Werror -Wno-unused-parameter

LOCAL_CFLAGS += -D_ANDROID_

ifeq ($(strip $(TARGET_USES_ION)),true)
LOCAL_CFLAGS += -DUSE_ION
endif

# System header file path prefix
LOCAL_CFLAGS += -DSYSTEM_HEADER_PREFIX=sys

OMX_CORE_DIR := $(MM_JPEG_TEST_PATH)/../../../../mm-image-codec

LOCAL_C_INCLUDES := $(MM_JPEG_TEST_PATH)
LOCAL_C_INCLUDES += $(MM_JPEG_TEST_PATH)/../inc
LOCAL_C_INCLUDES += $(MM_JPEG_TEST_PATH)/../../common
LOCAL_C_INCLUDES += $(MM_JPEG_TEST_PATH)/../../mm-camera-interface/inc
LOCAL_C_INCLUDES += $(OMX_CORE_DIR)/qexif
LOCAL_C_INCLUDES += $(OMX_CORE_DIR)/qomx_core

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_HEADER_LIBRARIES += media_plugin_headers
LOCAL_SRC_FILES := mm_jpegdec_test.c

LOCAL_32_BIT_ONLY := $(BOARD_QTI_CAMERA_32BIT_ONLY)
LOCAL_MODULE           := mm-jpegdec-interface-test
LOCAL_VENDOR_MODULE := true
include $(SDCLANG_COMMON_DEFS)
LOCAL_PRELINK_MODULE   := false
LOCAL_SHARED_LIBRARIES := libcutils libdl liblog libmmjpeg_interface

include $(BUILD_EXECUTABLE)

LOCAL_PATH := $(OLD_LOCAL_PATH)
