# Parallel Merge Sort

## Overview
This project implements a parallel merge sort algorithm in C++ using the tasking abstraction provided in `omp_tasking.hpp`. The implementation follows the divide-and-conquer structure of merge sort and uses task-based parallelism to sort the left and right halves concurrently for sufficiently large subarrays.

## Files
- `mergesort_seq.cpp` — source file containing the merge sort implementation
- `omp_tasking.hpp` — provided tasking abstraction
- `Makefile` — used to compile the program
- `bench.sh` — benchmarking script
- `results.csv` — recorded benchmark results

## How to Compile
To compile the program:

```bash
make clean
make