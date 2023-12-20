# 检查工作库是否存在，如果不存在则创建
if {[file isdirectory work] == 0} {
    vlib work
}

# 编译 Verilog 文件
vlog ./DT.v ./testfixture.v +define+VCD +define+TB1

# 启动 ModelSim 并运行仿真
vsim work.testfixture
# 或者在命令行模式中运行仿真
# vsim -c work.testfixture

add wave -radix hex -position insertpoint  \
sim:/testfixture/u_dut/IDLE \
sim:/testfixture/u_dut/FW \
sim:/testfixture/u_dut/BW \
sim:/testfixture/u_dut/clk \
sim:/testfixture/u_dut/reset \
sim:/testfixture/u_dut/done \
sim:/testfixture/u_dut/sti_rd \
sim:/testfixture/u_dut/sti_addr \
sim:/testfixture/u_dut/sti_di \
sim:/testfixture/u_dut/res_wr \
sim:/testfixture/u_dut/res_rd \
sim:/testfixture/u_dut/res_addr \
sim:/testfixture/u_dut/res_di \
sim:/testfixture/u_dut/res_do \
sim:/testfixture/u_dut/status \
sim:/testfixture/u_dut/nstatus \
sim:/testfixture/u_dut/bwp_win_pxy \
sim:/testfixture/u_dut/p_arg \
sim:/testfixture/u_dut/fw_result \
sim:/testfixture/u_dut/fw_result_valid \
sim:/testfixture/u_dut/bw_result \
sim:/testfixture/u_dut/general_win \
sim:/testfixture/u_dut/addr_count \
sim:/testfixture/u_dut/win_in \
sim:/testfixture/u_dut/win_wr_en \
sim:/testfixture/u_dut/i \
sim:/testfixture/u_dut/d0/_min4_8b
 
run -all
