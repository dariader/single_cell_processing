#!/bin/bash

PATH_ARACNE_JAR="/home/daria/Rprojects/ARACNe-AP/dist/aracne.jar" # path to jar
COUNT_MATRIX="/home/daria/Rprojects/LV_SC_project/pbmc-cpm.tsv" # make sure it is in ARACNe-compatible format
OUTPUT_FOLDER="/home/daria/Rprojects/LV_SC_project/ARACNA_out_2/" # desired ouput folder, will be created if not exists
MURINE_REGULATOR_FOLDER="/home/daria/Rprojects/single-cell-pipeline/ARACNe/mus/" # folder with regulator lists 
REGULATOR_LIST=("cotf" "tf" "surface")
NBOOT=200 # number of bootstraps
ARACNE_DIR="/home/daria/Rprojects/single-cell-pipeline/ARACNe" # where all aracne R scripts are placed

mkdir -p $OUTPUT_FOLDER


for REGULATOR in ${REGULATOR_LIST[@]};
do
echo $REGULATOR;
mkdir -p $OUTPUT_FOLDER/$REGULATOR

# calculate threshold

 java -Xmx12G -jar $PATH_ARACNE_JAR -e $COUNT_MATRIX -o $OUTPUT_FOLDER/${REGULATOR}_network --tfs $MURINE_REGULATOR_FOLDER/${REGULATOR}-mus-current-symbol.dat --pvalue 1E-8 --threads 16 --pvalue 1e-8 --seed 666 --calculateThreshold

# create networks

for i in $(seq 1 $NBOOT);
do java -Xmx12G -jar $PATH_ARACNE_JAR -e $COUNT_MATRIX -o $OUTPUT_FOLDER/${REGULATOR}_network --tfs $MURINE_REGULATOR_FOLDER/${REGULATOR}-mus-current-symbol.dat --pvalue 1E-8 --threads 16 --pvalue 1e-8 --seed $i; 
done
done

# consolidate bootstrap
for REGULATOR in ${REGULATOR_LIST[@]};
do
WORK_DIR="${OUTPUT_FOLDER}/${REGULATOR}_network/"
REG_FILE="${MURINE_REGULATOR_FOLDER}/${REGULATOR}-mus-current-symbol.dat"
Rscript ${ARACNE_DIR}/aracne_consolidate.r ${WORK_DIR} ${COUNT_MATRIX} ${REG_FILE} bonferroni 0.01
done

#consolidate regulators
cat */bootstrapNetwork*| sort| sort -u| grep -v Regulator > "${OUTPUT_FOLDER}/merged_net.tsv" 
