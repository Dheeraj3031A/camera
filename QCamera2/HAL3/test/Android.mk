LOCAL_PATH:=$(call my-dir)

# Build command line test app: mm-hal3-app
include $(CLEAR_VARS)

ifeq ($(TARGET_SUPPORT_HAL1),false)
LOCAL_CFLAGS += -DQCAMERA_HAL3_SUPPORT
endif

ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
    LOCAL_CFLAGS += -DCAMERA_CHIPSET_8953
else
    LOCAL_CFLAGS += -DCAMERA_CHIPSET_8937
endif

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/../ \
    $(LOCAL_PATH)/../../stack/mm-camera-interface/inc \
    hardware/qcom-caf/msm8952/media/libstagefrighthw \
    hardware/qcom-caf/msm8952/media/mm-core/inc

LOCAL_HEADER_LIBRARIES += libhardware_headers
LOCAL_HEADER_LIBRARIES += libbinder_headers
LOCAL_HEADER_LIBRARIES += libandroid_sensor_headers

LOCAL_SRC_FILES := \
    QCameraHAL3Base.cpp \
    QCameraHAL3MainTestContext.cpp \
    QCameraHAL3VideoTest.cpp \
    QCameraHAL3PreviewTest.cpp \
    QCameraHAL3SnapshotTest.cpp \
    QCameraHAL3RawSnapshotTest.cpp \
    QCameraHAL3Test.cpp


LOCAL_SHARED_LIBRARIES:= libutils liblog libcamera_metadata libcutils

LOCAL_STATIC_LIBRARIES := android.hardware.camera.common@1.0-helper

LOCAL_32_BIT_ONLY := $(BOARD_QTI_CAMERA_32BIT_ONLY)

LOCAL_MODULE:= hal3-test-app
LOCAL_VENDOR_MODULE := true
include $(SDCLANG_COMMON_DEFS)

LOCAL_CFLAGS += -Wall -Wextra -Werror

LOCAL_CFLAGS += -std=c++14 -std=gnu++1z

include $(BUILD_EXECUTABLE)
