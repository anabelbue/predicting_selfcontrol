PROJECT := analysisselfcontrol
WORKDIR := $(CURDIR)

# list below your targets and their recipies
all:
	Rscript -e "repro::automate()"
	Rscript Scripts/01_functions.R
	Rscript Scripts/02_data_prep.R
	Rscript Scripts/03_item_selection.R
	Rscript Scripts/04_dimension_reduction.R
	Rscript Scripts/05_final_analysis.R
	Rscript Scripts/06_ABCD_coding.R

include .repro/Makefile_Rmds
include .repro/Makefile_Docker

### Wrap Commands ###
# if a command is to be send to another process e.g. a container/scheduler use:
# $(RUN1) mycommand --myflag $(RUN2)
RUN1 = $(QRUN1) $(SRUN) $(DRUN)
RUN2 = $(QRUN2)

### Rmd's ###
include .repro/Makefile_Rmds

### Docker ###
# this is a workaround for windows users
# please set WINDOWS=TRUE and adapt WINPATH if you are a windows user
# note the unusual way to specify the path
WINPATH = //c/Users/someuser/Documents/myproject/
include .repro/Makefile_Docker

