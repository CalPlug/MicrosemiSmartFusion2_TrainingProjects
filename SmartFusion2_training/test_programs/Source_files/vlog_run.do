#---------------------------------------------------------------------------
# ModelSim command file for SmartFusion2 Day 1 training class
# File name: vlog_run.do
# Author: Tim McCarthy
# Revision History
# Rev		Commments			Date
# 1.0		Written				February, 2013
# 1.1		Changed project location	October 24, 2013
# 1.2		Modified for Libero v11.2	December 3, 2013
# 1.3		Modified for Libero v11.3	March 25, 2014
# 1.4		Modified for Libero v11.4   	September 2, 2014
# 1.5		Modified for Libero v11.5   	November 12, 2014
#----------------------------------------------------------------------------
quietly set ACTELLIBNAME SmartFusion2
# Edit the next line to match the location of your Libero project
quietly set PROJECT_DIR "C:/Microsemiprj/SF2_Fabric_tutorial/SmartFusion2_Fabric"
# Edit the next line to match the Libero installation location of your PC
quietly set INSTALL_DIR "C:/Microsemi/Libero_v11.5"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "${INSTALL_DIR}/Designer/lib/modelsim/precompiled/vlog/SmartFusion2"

vlog -work presynth "${PROJECT_DIR}/component/work/Fabric_Top/FCCC_0/Fabric_Top_FCCC_0_FCCC.v"
vlog -work presynth "${PROJECT_DIR}/hdl/LED_ctrl.v"
vlog -work presynth "${PROJECT_DIR}/component/work/Fabric_Top/OSC_0/Fabric_Top_OSC_0_OSC.v"
vlog -work presynth "${PROJECT_DIR}/component/work/Fabric_Top/Fabric_Top.v"
vlog "+incdir+${PROJECT_DIR}/stimulus" -work presynth "${PROJECT_DIR}/stimulus/user_testbench.v"

vsim -L SmartFusion2 -L presynth  -t 1fs presynth.testbench
do "vlog_wave.do"

run 42 us
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(12) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(11) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(10) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(9) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(8) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(7) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(6) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(5) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(4) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(3) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(2) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(1) 1 0
force -freeze sim:/testbench/Fabric_Top_0/LED_ctrl_0/counter(0) 1 0

run 1458 us
