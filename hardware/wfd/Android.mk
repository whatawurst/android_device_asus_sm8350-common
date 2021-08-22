include $(CLEAR_VARS)
WFD_NATIVE_SYMLINK := $(TARGET_OUT_SYSTEM_EXT)/priv-app/WfdService/lib/arm64/libwfdnative.so
$(WFD_NATIVE_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WFD native link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += \
    $(WFD_NATIVE_SYMLINK)
