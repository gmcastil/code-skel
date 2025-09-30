# Configuration settings shared with bash scrips in ./scripts
include tools.conf

SHELL			:= /bin/bash
PRINTF			:= /usr/bin/printf
MKDIR			:= /bin/mkdir
CTAGS			:= /bin/ctags

# Tools
VCOM			:= vcom
VLOG			:= vlog
VLIB			:= vlib
VDIR			:= vdir
VMAP			:= vmap
VDEL			:= vdel

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
CTAGS_EXCLUDE_DIRS	+= $(PWD)/.git $(PWD)/doc $(RUN_DIR)
CTAGS_FLAGS		= $(foreach dir,$(CTAGS_EXCLUDE_DIRS), --exclude=$(dir))
CTAGS_FLAGS		+= -R

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
	$(MKDIR) -pv $(RUN_DIR)
	if [[ -d $(RUN_DIR)/$(WORK) ]]; then \
		$(VDEL) -lib $(RUN_DIR)/$(WORK) -all; \
	fi
	$(VLIB) $(RUN_DIR)/$(WORK)
	$(VMAP) $(WORK) $(RUN_DIR)/$(WORK)
	$(VCOM) $(VCOM_FLAGS) -work $(WORK) -F $(RTL_DIR)/filelist.f

.PHONY: smoke ctags clean

smoke:
	@$(PRINTF) "%s\n" "MODELSIM = $(MODELSIM)"
	@$(PRINTF) "%s\n" "XILINX_SIMLIB_DIR = $(XILINX_SIMLIB_DIR)"
	@$(PRINTF) "%s\n" "ALTERA_SIMLIB_DIR = $(ALTERA_SIMLIB_DIR)"
	$(VDIR) -all

ctags:
	$(CTAGS) $(CTAGS_FLAGS) .
clean:
	$(RM) -rf -- $(RUN_DIR)
	$(RM) -f -- $(PWD)/tags
