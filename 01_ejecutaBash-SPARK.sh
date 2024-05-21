#!/bin/bash
#SBATCH --job-name="DCS_SPARK"
#SBATCH -n 1
#SBATCH --ntasks-per-node=5
#SBATCH --output=salida_spark_%j.log
#SBATCH --error=error_spark_%j.log
#SBATCH --mail-user=david.castro@utem.cl
#SBATCH --partition=iasma
#SBATCH --mem=16G
#SBATCH --time=24:00:00

# Cargar el módulo de Conda si es necesario

# Activar el entorno conda
source activate pyspark
pip install pandas


fecha_hora_actual=$(date +"%Y-%m-%d_%H-%M-%S")
TimeStart="$(date +"%c")"
echo "Starting of the script $TimeStart" > timing_log_spark_$fecha_hora_actual.txt


srun "python" "/home/dcastro/fasta/gen-01-SPARK.py"

TimeEnd="$(date +"%c")"
echo "Ending of the script $TimeEnd"  >> timing_log_spark_$fecha_hora_actualt.txt
