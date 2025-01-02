
OUT_DIR += /$(SRC_DIR) \
/$(SRC_DIR)/patch_sdk \
/$(SRC_DIR)/base_components \
/$(SRC_DIR)/zigbee \
/$(SRC_DIR)/zigbee/clusters \
/$(SRC_DIR)/zigbee/endpoints\
/$(SRC_DIR)/custom_zcl \
/$(SRC_DIR)/zigbee \
/$(SRC_DIR)/boards/ts0001 \
/$(SRC_DIR)/boards/ts0012 

OBJS += \
$(BUILD_PATH)/$(SRC_DIR)/patch_sdk/flash.o \
$(BUILD_PATH)/$(SRC_DIR)/patch_sdk/flash_drv.o \
$(BUILD_PATH)/$(SRC_DIR)/patch_sdk/cstartup_8258.o \
$(BUILD_PATH)/$(SRC_DIR)/patch_sdk/hw_drv.o \
$(BUILD_PATH)/$(SRC_DIR)/patch_sdk/adc_drv.o \
$(BUILD_PATH)/$(SRC_DIR)/patch_sdk/random.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/general_commands.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/basic_cluster.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/switch_cluster.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/relay_cluster.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/endpoint.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/bdb_callbacks.o \
$(BUILD_PATH)/$(SRC_DIR)/zigbee/general.o \
$(BUILD_PATH)/$(SRC_DIR)/custom_zcl/zcl_onoff_configuration.o \
$(BUILD_PATH)/$(SRC_DIR)/custom_zcl/zcl_multistate_input.o \
$(BUILD_PATH)/$(SRC_DIR)/device.o \
$(BUILD_PATH)/$(SRC_DIR)/main.o \
$(BUILD_PATH)/$(SRC_DIR)/ext_ota.o \
$(BUILD_PATH)/$(SRC_DIR)/reporting.o \
$(BUILD_PATH)/$(SRC_DIR)/base_components/button.o \
$(BUILD_PATH)/$(SRC_DIR)/base_components/led.o \
$(BUILD_PATH)/$(SRC_DIR)/base_components/millis.o \
$(BUILD_PATH)/$(SRC_DIR)/base_components/relay.o

ifeq ($(BOARD), TS0012)
	OBJS += \
		$(BUILD_PATH)/$(SRC_DIR)/boards/ts0012/peripherals.o \
		$(BUILD_PATH)/$(SRC_DIR)/boards/ts0012/device_init.o 
endif

ifeq ($(BOARD), TS0012_END_DEVICE)
	OBJS += \
		$(BUILD_PATH)/$(SRC_DIR)/boards/ts0012/peripherals.o \
		$(BUILD_PATH)/$(SRC_DIR)/boards/ts0012/device_init.o 
endif

ifeq ($(BOARD), TS0001)
	OBJS += \
		$(BUILD_PATH)/$(SRC_DIR)/boards/ts0001/peripherals.o \
		$(BUILD_PATH)/$(SRC_DIR)/boards/ts0001/device_init.o 
endif


$(BUILD_PATH)/$(SRC_DIR)/%.o: $(PROJECT_PATH)/$(SRC_DIR)/%.c
	@echo 'Building file: $<'
	@$(CC) $(GCC_FLAGS) $(INCLUDE_PATHS) -c -o"$@" "$<"
	
$(BUILD_PATH)/$(SRC_DIR)/%.o: $(PROJECT_PATH)/$(SRC_DIR)/%.S
	@echo 'Building file: $<'
	@$(CC) $(GCC_FLAGS) $(ASM_FLAGS) $(INCLUDE_PATHS) -c -o"$@" "$<"