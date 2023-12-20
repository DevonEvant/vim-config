echo "开始编译"
iverilog -o wave.vvp -s testfixture  -E ./testfixture.v  ./DT.v -D TB1 -D VCD
echo "编译完成"
vvp ./wave.vvp -fst
# vvp -n wave -lxt2
# echo "生成波形文件"
# cp DT.vcd DT.lxt
