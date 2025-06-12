# Reproducing the results

This repository contains all code, data, and configuration needed to reproduce the analysis for the article  
*[Linking Trait Items of Self-Control to Broader Conceptualizations of Self-Control Using Machine Learning](https://doi.org/10.31234/osf.io/3jsy8_v1)*


### Step 1: Download the repository
Chose one of these options: 

- **Option A:** Download the repository as a ZIP file by clicking the green *Code* button on the top right of this page
- **Option B:** Clone the repository using Git (requires Git to be installed):

```
git clone https://github.com/anabelbue/predicting_selfcontrol.git
cd predicting_selfcontrol
```

### Step 2: Install prerequisites

Make sure the following software is installed on your system:

- [Docker](https://www.docker.com/get-started)
- [GNU Make](https://www.gnu.org/software/make/)
- [Git](https://git-scm.com/) (only needed if you choose Option B above)


### Step 3: Run the full pipeline

In your terminal, run:

```
make all
```

This will:

- Set up the entire R environment and install packages automatically via Docker (using the [`repro`](https://github.com/aaronpeikert/repro) package)
- Run the entire analysis pipeline
- Create all outputs in the appropriate folders:

```
ML results/
EFA results/
tables/
plots/
```

Please note that in the default version, time-intensive computational steps are excluded (i.e., they will not be run again, but the already generated output saved in the repository will be used).  
This concerns the elastic net models in the script `03_item_selection.R`. To also reproduce these models, simply change `run_elastic_net_models` from `FALSE` to `TRUE` in the section of that script. 
