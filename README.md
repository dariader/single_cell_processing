# single_cell_processing

This repository contains customized metaVipern pipeline to analyze mice scRNA data. 

## How to use
1. load all packages from requirements.R
2. correct in the Rmd files the location of folders and files
3. Install ARACNe-AP software using this guide: https://github.com/califano-lab/ARACNe-AP
4. Run the pipeline. While rinning run_aracne.sh script change location of the folders in the script. 

Example Folder structure:
```
── single-cell-pipeline
        └── functions
                  └── viper-utils.R 
                  └── process-utils.R
                  └── cluster-functions.R
        └── ARACNe
                  └── aracne-consolidate.R
                  └── mus
                        └── <regulator files>: tf, cotf, surface
── ARACNe-AP
            └── ARACNe-AP.jar
            
── single-cell-processing
        └── run_aracne.sh
        └── scRNA_murine.Rmd
        └── requirements.R
 ```

## Dependencies
see requirements.R for that

## References
https://github.com/califano-lab/single-cell-pipeline

Cytoscape v3.3.0.
