action = "simulation"
sim_tool = "modelsim"
top_module = "minimig_cpu_tb"

sim_post_cmd = "vsim -L altera_mf_ver -novopt -do vsim.do -i minimig_cpu_tb"
#sim_post_cmd = "vsim -L altera_mf_ver +acc=v -do vsim.do -i minimig_cpu_tb"

files = [
   #"../../../rtl/soc/minimig_de1_top.v",
   #"../../../rtl/soc/minimig_mist_top.v",
   "../../rtl/mist/user_io.v",
   "./minimig_cpu_tb.v"
]

modules = {
  "local" : [
    "../../rtl/io",
    "../../rtl/fifo",
    "../../rtl/ctrl",
    "../../rtl/clock",
    "../../rtl/soc",
    
    "../../rtl/minimig",
    "../../rtl/audio",
    "../../rtl/or1200",
    "../../rtl/sdram",
    
    "../../rtl/tg68k",
    "../../lib/models",
    "../../lib/io",
    "../../bench/minimig",    
    ],
}
