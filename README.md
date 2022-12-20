# single_cell_processing

This repository contains customized metaVipern pipeline to analyze mice scRNA data. 

## How to use
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
        └── run_aracne.R
        └── scRNA_murine.Rmd
        └── requirements.R

── additional_files
        └── sample_count_matrix.tsv
        └── human_atherosclerosis_count_matrix.tsv
        └── gene_dictionary.tsv
 ```

## Dependencies
1) Seurat v3.1.1.
2) SingleR package

## References
https://github.com/califano-lab/single-cell-pipeline
Cytoscape v3.3.0.
