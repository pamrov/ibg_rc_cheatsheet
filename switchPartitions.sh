#!/bin/bash

#PURRPOSE: Sample script where the partition to submit the job to is user-defined when submitting this script. This script calls an R script that simulates SNPxSNP interactions with rs16969968 with varying parameters from a parameter file. 

#total num of sim rounds: 1,026,895
#total sim rounds per sample size (5 sample sizes tot): 205,379

input args
  #partition

ml slurm/$partition

if [[ $partition="blanca" ]];
do
  #SBATCH --qos=preemptable
  #SBATCH --ntasks=1
  #SBATCH --time=24:00:00
  #SBATCH --array=1-1,026,895:100
  #SBATCH --output=/rc_scratch/paro1093/power_rs169/trueEffect/slurm/trueEff-job-%A-startpt-%a.out
fi

if [[ $partition="summit" ]];
do
  #SBATCH --qos=normal
  #SBATCH --partition=shas
  #SBATCH --ntasks=1
  #SBATCH --time=24:00:00
  #SBATCH --array=1-1,026,895:100
  #SBATCH --output=/scratch/summit/paro1093/power_rs169/trueEffect/slurm/trueEff-job-%A-startpt-%a.out
fi

ml load intel mkl
  #intel math kernel library
  #allows for higher-level languages to interact better
ml R/3.5.0

Rscript /pl/active/IBG/promero/power_rs169/run_trueEff_pwr.R
