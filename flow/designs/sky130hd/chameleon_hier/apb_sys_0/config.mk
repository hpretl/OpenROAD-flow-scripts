

export TOP_NICKNAME = chameleon_hier
export TOP_DIR = ./designs/$(PLATFORM)/${TOP_NICKNAME}

export DESIGN_NAME = apb_sys_0
export DESIGN_NICKNAME = ${TOP_NICKNAME}_${DESIGN_NAME}
export PLATFORM    = sky130hd
export RTL_DIR  = ./designs/src/${TOP_NICKNAME}/rtl

export VERILOG_FILES = \
                         ${RTL_DIR}/AHB_sys_0/APB_sys_0/*\
	                 ${RTL_DIR}/IPs/*.v

			 
export SDC_FILE          = ${TOP_DIR}/${DESIGN_NAME}/constraint.sdc

export PDN_CFG = ${TOP_DIR}/${DESIGN_NAME}/pdn.cfg

export ABC_CLOCK_PERIOD_IN_PS = 10000
export ABC_DRIVER_CELL = sky130_fd_sc_hd__buf_1
export ABC_LOAD_IN_FF = 3


# Point to the RC file
export SETRC_FILE = $(PLATFORM_DIR)/setRC.tcl
export FASTROUTE_TCL $(PLATFORM_DIR)/fastroute.tcl

# These values must be multiples of placement site
#export DIE_AREA    = 0 0 450 700
#export CORE_AREA    = 0 0 450 700
export DIE_AREA    = 0 0 675 1050
#export CORE_AREA    = 0 0 675 1050
export CORE_AREA    = 0.46 2.720 674.54 1047.28  


export MIN_ROUTING_LAYER 2
export MAX_ROUTING_LAYER 5

