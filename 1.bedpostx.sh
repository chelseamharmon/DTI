#!/bin/sh

#SBATCH --account=psych
#SBATCH --job-name=bedpostx_run
#SBATCH -c 1
#SBATCH --time=23:55:00
#SBATCH --mem-per-cpu=32gb

n=$1
cd /rigel/psych/users/cmh2228/SB/BEDPOSTX
pwd
bedpostx ${n}
