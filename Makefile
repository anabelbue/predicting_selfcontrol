PROJECT := analysisselfcontrol
WORKDIR := $(CURDIR)
RUN1 = docker run --rm -v $(WORKDIR):/home/rstudio --user $(shell id -u):$(shell id -g) ghcr.io/anabelbue/predicting_selfcontrol:main Rscript
STAMPS := .stamps

$(STAMPS):
	mkdir -p $(STAMPS)

# 02_data_prep.R: produces Data/prep_data.csv as its key output
Data/prep_data.csv: Scripts/02_data_prep.R Scripts/01_functions.R Data/codebook.xlsx Data/raw_dat.csv
	$(RUN1) Scripts/02_data_prep.R

# 03_item_selection.R: produces many ML results/ files, tracked via stamp
$(STAMPS)/03_item_selection: Scripts/03_item_selection.R Scripts/01_functions.R Data/prep_data.csv | $(STAMPS)
	$(RUN1) Scripts/03_item_selection.R
	touch $@

# 04_dimension_reduction.R: produces many EFA/plot files, tracked via stamp
$(STAMPS)/04_dimension_reduction: Scripts/04_dimension_reduction.R Scripts/01_functions.R Data/prep_data.csv Data/codebook.xlsx $(STAMPS)/03_item_selection | $(STAMPS)
	$(RUN1) Scripts/04_dimension_reduction.R
	touch $@

# 05_final_analysis.R: depends on 03's outputs directly, NOT on 04
$(STAMPS)/05_final_analysis: Scripts/05_final_analysis.R Scripts/01_functions.R Data/prep_data.csv Data/codebook.xlsx $(STAMPS)/03_item_selection | $(STAMPS)
	$(RUN1) Scripts/05_final_analysis.R
	touch $@

# 06_ABCD_coding.R: depends on 03's outputs plus the raw rater spreadsheets
$(STAMPS)/06_ABCD_coding: Scripts/06_ABCD_coding.R Scripts/01_functions.R Data/prep_data.csv Data/codebook.xlsx $(STAMPS)/03_item_selection | $(STAMPS)
	$(RUN1) Scripts/06_ABCD_coding.R
	touch $@

all: Data/prep_data.csv $(STAMPS)/03_item_selection $(STAMPS)/04_dimension_reduction $(STAMPS)/05_final_analysis $(STAMPS)/06_ABCD_coding

update-docker:
	Rscript -e "repro::automate()"

include .repro/Makefile_Docker