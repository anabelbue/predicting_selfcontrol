# Reproducing the Analysis

This repository contains all code, data, and configuration needed to reproduce the analysis for the article  
"Linking Trait Items of Self-Control to Broader Conceptualizations of Self-Control Using Machine Learning."


### Step 1: Download the repository
Chose one of these options: 
1. Dowlonad the repository as ZIP file by clicking the green code button on the top right
2. Clone the repository using git 

```
git clone https://github.com/anabelbue/predicting_selfcontrol.git
cd predicting_selfcontrol
```

### Step 2: Install prerequisites

Make sure the following software is installed on your system:

- [Docker](https://www.docker.com/get-started)
- [GNU Make](https://www.gnu.org/software/make/)
- - [Git](https://git-scm.com/) (only needed for Option 2 in Step 1)

### Step 2: Clone the repository

Open your terminal and run:


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
