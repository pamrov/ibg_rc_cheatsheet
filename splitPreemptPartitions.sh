#!/bin/bash

#PURRPOSE: Sample script where you split your work across partitions. This script calls a bash script with an R script that simulates SNPxSNP interactions with rs16969968 with varying parameters from a parameter file.

#total num of sim rounds: 1,026,895
#number of reps per sim: 100
#total sims per sample size (5 sample sizes tot): 205,379

#script info:
scriptDir="/pl/active/IBG/promero/power_rs169"
scripName="run_trueEff_pwr.sh"
#geno data loc:
parentDir="/rc_scratch/paro1093/plink_bgen_03dos"
subDirPrefix="chr"

#counters for rounds of sim to run for each:
ntotSims=1026895
nSimRounds=100

cd $parentDir/$subDirPrefix$chr

for simCount in {1..$ntotSims}
do
  if [[ $simCount -le 50000 ]] #run first half of sims on blanca
  ml slurm/blanca
  sbatch --qos=preemptable --array=$1-$nSimRounds $scriptDir/${scriptName}.sh

  if [[ $simCount -g 50000 ]] #run second half of sims on summit
  ml slurm/summit
  sbatch --part=ssky-preemptable --array=$1-nSimRounds $scriptDir/${scriptName}.sh
done
