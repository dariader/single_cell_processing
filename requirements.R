## install packages from CRAN
install.packages('devtools', lib="./project_packages/")# sudo apt install libxml2-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
install.packages('BiocManager', lib="./project_packages/")
install.packages('dplyr', lib="./project_packages/")
install.packages('Matrix', lib="./project_packages/")
##/usr/bin/ld: cannot find -llapack: No such file or directory
##/usr/bin/ld: cannot find -lblas: No such file or directory
##/usr/bin/ld: cannot find -lgfortran: No such file or directory
## sudo apt-get install libblas-dev liblapack-dev gfortran

install.packages('gdata', lib="./project_packages/")
install.packages('knitr', lib="./project_packages/")
install.packages('kableExtra', lib="./project_packages/")
install.packages('reshape2', lib="./project_packages/")
install.packages('ggpubr', lib="./project_packages/") #sudo apt-get install cmake
install.packages('RColorBrewer', lib="./project_packages/")
install.packages('umap', lib="./project_packages/")
install.packages('ggplot2', lib="./project_packages/")
install.packages('optparse', lib="./project_packages/")

## install packages from BioConductor
# sudo apt install libbz2-dev
BiocManager::install("DropletUtils", lib="./project_packages/")# if error -> sudo apt install --reinstall binutils
BiocManager::install("EnsDb.Hsapiens.v86", lib="./project_packages/", dependencies=T)
BiocManager::install("viper", lib="./project_packages/")
#apt-get install libcairo2-dev libxt-dev 
BiocManager::install("scater", lib="./project_packages/", dependencies=T)
## install packages from Github
devtools::install_github("JEFworks/MUDAN", lib="./project_packages/", force = TRUE)

library('gdata')
library('scater')
library('knitr')
library('kableExtra')
library('reshape2')
library('ggpubr')
library('RColorBrewer')
library('umap')
library('ggplot2')
library('optparse')

## install packages from BioConductor
library("DropletUtils")# if error -> sudo apt install --reinstall binutils
library("EnsDb.Hsapiens.v86")
library("viper")

## install packages from Github
library("MUDAN")


