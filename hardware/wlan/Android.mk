include $(CLEAR_VARS)
WLAN_COUNTRY_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/COUNTRY
$(WLAN_COUNTRY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WLAN COUNTRY link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/factory/$(notdir $@) $@

WLAN_MAC_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/wlan_mac.bin
$(WLAN_MAC_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WLAN MAC bin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/factory/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += \
    $(WLAN_COUNTRY_SYMLINK) \
    $(WLAN_MAC_SYMLINK)
