#!/bin/bash
#SBATCH --job-name="DCS_BASH"
#SBATCH -n 1
#SBATCH --ntasks-per-node=5
#SBATCH --output=salida_bash_%j.log
#SBATCH --error=error_bash_%j.log
#SBATCH --mail-user=david.castro@utem.cl
#SBATCH --partition=iasma
#SBATCH --mem=16G
#SBATCH --time=24:00:00

# Cargar el módulo de Conda si es necesario

# Activar el entorno conda
#source activate pyspark

fecha_hora_actual=$(date +"%Y-%m-%d_%H-%M-%S")
TimeStart="$(date +"%c")"
echo "Starting of the script $TimeStart" > timing_log_bash_$fecha_hora_actual.txt


srun "python" "/home/dcastro/fasta/gen-03-BASH.py"

TimeEnd="$(date +"%c")"
echo "Ending of the script $TimeEnd"  >> timing_log_bash_$fecha_hora_actualt.txt


