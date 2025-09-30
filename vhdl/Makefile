# Configuration settings shared with bash scrips in ./scripts
include tools.conf

SHELL			:= /bin/bash
PRINTF			:= /usr/bin/printf

# Tools
VCOM			:= vcom
VLOG			:= vlog
VLIB			:= vlib
VDIR			:= vdir
VMAP			:= vmap

# Specify the path to the modelsim.ini file - this forces us to use the local
# version which references the Xilinx simulation library path
MODELSIM		:= $(shell readlink -f sim/modelsim.ini)
export MODELSIM

# Sanity checks here or compilation will fail at some point
ifndef XILINX_SIMLIB_DIR
$(error XILINX_SIMLIB_DIR is unset and should point to Xilinx simulation libraries)
endif
ifndef ALTERA_SIMLIB_DIR
$(error ALTERA_SIMLIB_DIR is unset and should point to Altera simulation libraries)
endif

# Directories to exclude when creating a tags file. This prevents creating tags
# that reference Xilinx IP or project files 
CTAGS_EXCLUDE_DIRS	=
CTAGS_EXCLUDE_DIRS	+= $(PWD)/.git $(PWD)/doc
CTAGS_FLAGS		+= $(foreach dir,$(CTAGS_EXCLUDE_DIRS), --exclude=$(dir))

# Tool settings
VCOM_FLAGS		:= -2002 -lint
VLOG_FLAGS		:= -sv -lint

# Required paths and library names
RUN_DIR			:= $(shell readlink -f $(PWD)/rundir)
SIM_DIR			:= $(PWD)/sim
RTL_DIR			:= $(PWD)/rtl

RTL_FILES		:= $(wildcard $(RTL_DIR)/*.vhd)

WORK			:= work

$(RUN_DIR)/$(WORK)/_info: $(RTL_DIR)/filelist.f $(RTL_FILES)
	$(PRINTF) "Would run\n"

# Compile the Altera DUT from the list of RTL files
# $(RUN_DIR)/$(ALTERA_WORK): $(DUT_RTL_DIR)/decoder_altera.f $(ALTERA_FILES) 
# 	$(MKDIR) -pv $(RUN_DIR)
# 	# Always remove the database if it already exists
# 	if [[ -d $(RUN_DIR)/$(ALTERA_WORK) ]]; then \
# 		$(VDEL) -lib $(RUN_DIR)/$(ALTERA_WORK) -all; \
# 	fi
# 	$(VLIB) $(RUN_DIR)/$(ALTERA_WORK)
# 	$(VMAP) $(NDI_WORK) $(RUN_DIR)/$(ALTERA_WORK)
# 	$(VCOM) $(VCOM_FLAGS) -work $(NDI_WORK) -F $(DUT_RTL_DIR)/decoder_altera.f

.PHONY: smoke
smoke:
	@echo MODELSIM = $(MODELSIM)
	@echo XILINX_SIMLIB_DIR = $(XILINX_SIMLIB_DIR)
	@echo ALTERA_SIMLIB_DIR = $(ALTERA_SIMLIB_DIR)
	$(VDIR) -all
clean:
	$(RM) -rf $(RUN_DIR)

