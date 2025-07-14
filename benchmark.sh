#!/bin/bash

COUNT=100        # How many tests
SIZE=100         # How many numbers in each test
TOTAL=0

for ((i=1; i<=COUNT; i++))
do
    # Generate a random list of SIZE unique numbers
    ARG=$(python3 -c "import random; print(' '.join(map(str, random.sample(range(100000), $SIZE))))")
    # Get number of instructions from push_swap
    OP_COUNT=$(./push_swap $ARG | wc -l)
    
    echo "Test $i: $OP_COUNT operations"
    
    TOTAL=$((TOTAL + OP_COUNT))
done

AVG=$((TOTAL / COUNT))

echo "-----------------------------------"
echo "Average operations over $COUNT runs: $AVG"
