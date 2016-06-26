action = "simulation"
sim_tool = "modelsim"
top_module = "soc_tb"

#sim_post_cmd = "vsim -L altera_mf_ver -novopt -do vsim.do -i soc_tb"
sim_post_cmd = "vsim -L altera_mf_ver -voptargs=+acc=v -do vsim.do -i soc_tb"

files = [
   #"../../../rtl/soc/minimig_de1_top.v",
   #"../../../rtl/soc/minimig_mist_top.v",
   "../../../rtl/mist/user_io.v",
]

modules = {
  "local" : [
    "../../../rtl/io",
    "../../../rtl/fifo",
    "../../../rtl/ctrl",
    "../../../rtl/clock",
    "../../../rtl/soc",
    
    "../../../rtl/minimig",
    "../../../rtl/audio",
    #"../../../rtl/or1200",
    "../../../rtl/sdram",
    
    "../../../rtl/tg68k",
    "../../../lib/models",
    "../../../lib/io",
    "../../../bench/minimig", 
    "../../../lib/spi",
    ],
}

#../../../../rtl/soc/minimig_de1_top.v
#
#../../../../rtl/io/i_sync.v
#
#../../../../rtl/fifo/sync_fifo.v
#
#../../../../rtl/sdram/sdram_ctrl.v
#../../../../rtl/sdram/sdram.vhd
#../../../../rtl/sdram/cpu_cache.v
#../../../../rtl/sdram/tpram_inf_128x32.v
#../../../../rtl/sdram/tpram_inf_be_512x16.v
#
#../../../../fw/amiga_boot/bin/amiga_boot.v
#
#../../../../rtl/io/indicators.v
#../../../../rtl/io/sseg_decode.v
#
#../../../../rtl/tg68k/TG68K_Pack.vhd
#../../../../rtl/tg68k/TG68K_ALU.vhd
#../../../../rtl/tg68k/TG68KdotC_Kernel.vhd
#../../../../rtl/tg68k/TG68K.vhd