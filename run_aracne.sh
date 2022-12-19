#!/bin/bash
PATH_ARACNE_JAR="/home/daria/Rprojects/ARACNe-AP/dist/aracne.jar"
COUNT_MATRIX="/home/daria/Rprojects/LV_SC_project/pbmc-cpm.tsv" # make sure it is in ARACNe-compatible format
OUTPUT_FOLDER="/home/daria/Rprojects/LV_SC_project/ARACNA_out/"
MURINE_REGULATOR_FOLDER="/home/daria/Rprojects/single-cell-pipeline/ARACNe/mus/"
REGULATOR_LIST=("cotf" "tf" "surface")
$NBOOT = 200

for REGULATOR in ${REGULATOR_LIST[@]};
do
echo $REGULATOR;
# calculate threshold

 java -Xmx12G -jar $PATH_ARACNE_JAR -e $COUNT_MATRIX -o $OUTPUT_FOLDER/${REGULATOR}_network --tfs $MURINE_REGULATOR_FOLDER/${REGULATOR}-mus-current-symbol.dat --pvalue 1E-8 --threads 16 --pvalue 1e-8 --seed 666 --calculateThreshold

# create network files

for i in {1..200};
do java -Xmx12G -jar $PATH_ARACNE_JAR -e $COUNT_MATRIX -o $OUTPUT_FOLDER/${REGULATOR}_network --tfs $MURINE_REGULATOR_FOLDER/${REGULATOR}-mus-current-symbol.dat --pvalue 1E-8 --threads 16 --pvalue 1e-8 --seed $i; 
done

# consolidate bootstrap
ARACNE_DIR="/home/daria/Rprojects/single-cell-pipeline/ARACNe" # where all aracne scripts are placed
WORK_DIR="/home/daria/Rprojects/LV_SC_project/ARACNA_out/${REGULATOR}/"
REG_FILE="${MURINE_REGULATOR_FOLDER}/${REGULATOR}-mus-current-symbol.dat"

Rscript ${ARACNE_DIR}/aracne_consolidate.r ${WORK_DIR} ${COUNT_MATRIX} ${REG_FILE} bonferroni 0.01

done
