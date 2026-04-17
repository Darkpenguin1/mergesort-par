#!/bin/bash
#SBATCH --job-name=merge-par
#SBATCH --partition=Centaurus
#SBATCH --time=02:00:00
#SBATCH --output=logs/%x-%j.out
#SBATCH --error=logs/%x-%j.err
#SBATCH --mem=20GB
#SBATCH --cpus-per-task=8


EXEC=./mergesort_seq
OUTFILE=results.csv

SIZES=(100000 1000000)
THREADS=(1 2 4 8)
REPEATS=2

if [ ! -x "$EXEC" ]; then
    echo "Error: $EXEC not found or not executable"
    exit 1
fi

echo "size,threads,run,time_sec" > "$OUTFILE"

echo "Starting benchmark..."

for size in "${SIZES[@]}"; do
    for threads in "${THREADS[@]}"; do
        for run in $(seq 1 $REPEATS); do
            echo "Running: n=$size threads=$threads run=$run"

            # capture stderr because your program prints elapsed time to cerr
            time_sec=$($EXEC "$size" "$threads" 2>&1 >/dev/null | tail -n 1)

            echo "$size,$threads,$run,$time_sec" >> "$OUTFILE"
        done
    done
done

echo "Done."
echo "Results saved to $OUTFILE"
