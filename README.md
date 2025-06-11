# Reproducing the Analysis

This repository contains all code, data, and configuration needed to reproduce the analysis for the article  
"Linking Trait Items of Self-Control to Broader Conceptualizations of Self-Control Using Machine Learning."

## Steps to Reproduce

### Step 1: Install prerequisites

Make sure the following software is installed on your system:

- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/get-started)
- [GNU Make](https://www.gnu.org/software/make/)  
  (On macOS, you can run `brew install make` if not already installed)

### Step 2: Clone the repository

Open your terminal and run:

```
git clone https://github.com/anabelbue/predicting_selfcontrol.git
cd predicting_selfcontrol
```

### Step 3: Run the full pipeline

In your terminal, run:

```
make all
```

This will:

- Use the [`repro`](https://github.com/aaronpeikert/repro) package to configure the software environment
- Automatically install all required R packages (via Docker)
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
