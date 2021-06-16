#!/bin/bash

######################
# 0: README
######################
<<README_Comment
This script has handy slurm commands for checking on current and past jobs youve run.
Please dont edit this script directly, instead, make a copy of it in your own directory.
>>README_Comment

######################
# 1: Running Jobs
######################
#When will my job start?
squeue --user=$USER --start

#View your running jobs:
squeue -u $USER -t RUNNING

#List all pending jobs for a user:
squeue -u $USER  -t PENDING

#View more details of running jobs:
  #JobId                                #state
  #partition                            #Time running
  #JobName                              #Time limit
  #USER                                 #node it's running on
squeue -u $USER -l

#View more details, including what qos you're running in:
  #JobId                            #Time running
  #JobName                          #Time limit
  #QOS                              #node it's running on
  #jobState (R=running, PD=pending, S=sleep)
squeue -u $USER -o "%.12i %.18j %.16q %.8T %.10M %.12l %.24R"

#Monitor memory usage on active jobs:
sstat --jobs=your_job-id --format=User,JobName,JobId,MaxRSS

######################
# 2: Past Jobs
######################
#Display jobs completed since a particular date
sacct -S <MMDD>

#How much memory did my job use?
sacct --starttime=YYYY-MM-DD --jobs=your_job-id --format=User,JobName,JobId,MaxRSS
sacct --jobs=your_job-id --format=User,JobName,JobId,MaxRSS
