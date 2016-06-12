Minimig-2016

Project based on rkrajnc/minimist-mist https://github.com/rkrajnc/minimig-mist.git

Development Goals /ToDo:
- Remove dedicated NC-SIM stuff
- remove existing makefiles
+ fix or remove broken simulation stuff
+ Add Build and simulation environment based on HDLMake (http://www.ohwr.org/projects/hdl-make)
  Caution: Actually V2.2 (Develop) http://www.ohwr.org/projects/hdl-make/repository/show?rev=develop must be used
  HDLMake is Python based and will run under Unixoid OS or Windows with help of cygwin
  change to the DIR and simple run hdlmake; for simulation (for example /sim/minimig/modelsim) will create a makefile that can be started for simulation w. modelsim
+ resolve all issues preventing from using Icarus Simulator
+ resolve all FPGA/Board dependencies
  