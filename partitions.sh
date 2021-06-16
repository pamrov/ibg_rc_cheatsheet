#!/bin/bash

######################
# 0: README
######################
<<README_Comment
This script lays out all of the different partitions and qos I commonly use across super computers (Summit v. Blanca). The first listed partition (skylake) has longer descriptions of each flag to explain what they are.

Please dont edit this script directly, instead, make a copy of it in your own directory.
>>README_Comment

#######################
# 0: SUMMIT PARTITIONS
#######################

#skylake:
#-----------------
#SBATCH --job-name=run_rs169xGene              #JOBNAME
#SBATCH --array=1-22                           #JOB ARRAY
#SBATCH --time=24:00:00                        #WALL TIME
  #WALL TIME: max time before quitting job
#SBATCH --partition=ssky,ssky-preemptable      #PARTITION/ACCOUNT
#SBATCH --mem=130gb                            #MEMORY, IN GB
  # Total amount of memory to allocate
#SBATCH --ntasks=2                             #NUMBER OF CORES/PROCESSES
#SBATCH --output=/scratch/summit/paro1093/magma/rs169xGene_analysis/slurm/slurm-run_rs169xGene_newMGMversion_chr%a.mgm.out

#shas:
#------------------
#SBATCH --job-name=rs5656_top             #JOBNAME
#SBATCH --array=8                         #JOB ARRAY
#SBATCH --time=24:00:00                   #WALL TIME
#SBATCH --partition=shas                  #PARTITION/ACCOUNT
#SBATCH --qos=normal                      #QOS
  # Quality of Service: limits characteristics of job
#SBATCH --mem=90gb                        #MEMORY, IN GB
#SBATCH --ntasks=2                        #NUMBER OF CORES/PROCESSES
  # Number of CPUs, always request in multiples of 2
#SBATCH --output=/scratch/summit/paro1093/magma/rs169xGene_analysis/slurm/slurm-test_top_rs5656xGene_chr%a.mgm.out

#######################
# 1: BLANCA PARTITIONS
#######################

#preemptable
#-----------------------
#SBATCH --time 24:00:00
#SBATCH --qos=preemptable
#SBATCH --mem=140gb
#SBATCH --ntasks 16
#SBATCH --nodes=1
  # Keep all tasks of one array (job) in same node
#SBATCH --array 1-5
  # Number of jobs
#SBATCH --output=/rc_scratch/paro1093/matSmok_GxE/chr.%a.contOutcomes_testAndy.03dos.out
