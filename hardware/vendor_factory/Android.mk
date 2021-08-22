LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
VENDOR_FACTORY_SYMLINK := $(TARGET_OUT_VENDOR)/factory
$(VENDOR_FACTORY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "vendor factory link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /mnt/vendor/persist $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(VENDOR_FACTORY_SYMLINK)
