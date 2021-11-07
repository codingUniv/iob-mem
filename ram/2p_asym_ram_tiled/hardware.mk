include $(MEM_DIR)/core.mk

# Submodules
include $(RAM_DIR)/2p_asym_ram/hardware.mk

# Sources
ifneq (2P_ASYM_RAM_TILED,$(filter 2P_ASYM_RAM_TILED, $(SUBMODULES)))
SUBMODULES+=2P_ASYM_RAM_TILED
2P_ASYM_RAM_TILED_DIR=$(RAM_DIR)/2p_asym_ram_tiled
VSRC+=$(2P_ASYM_RAM_TILED_DIR)/iob_2p_asym_ram_tiled.v
endif
