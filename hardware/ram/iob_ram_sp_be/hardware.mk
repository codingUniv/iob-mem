ifneq ($(ASIC),1)
ifneq (iob_ram_sp_be,$(filter $S, $(HW_MODULES)))

# Add to modules list
HW_MODULES+=iob_ram_sp_be

# Submodules
include $(MEM_DIR)/hardware/ram/iob_ram_sp/hardware.mk

# Sources
VSRC+=$(MEM_DIR)/hardware/ram/iob_ram_sp_be/iob_ram_sp_be.v

endif
endif
