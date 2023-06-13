# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.cache/wt} [current_project]
set_property parent.project_path {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {c:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/IFetch.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/MainControl.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/IDecode.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/SSD.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/ExecutionUnit.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/MPG.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/MEM.vhd}
  {C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/sources_1/imports/mips ciclu unic final/lab7_4.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/constrs_1/imports/MIPS PIPELINE FINAL/constrains.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/MSI/Documents/Semestrul 2 anul 2/AC/mips ciclu unic final ALEXA/mips ciclu unic final ALEXA.srcs/constrs_1/imports/MIPS PIPELINE FINAL/constrains.xdc}}]


synth_design -top test_env -part xc7a35tcpg236-1


write_checkpoint -force -noxdef test_env.dcp

catch { report_utilization -file test_env_utilization_synth.rpt -pb test_env_utilization_synth.pb }
