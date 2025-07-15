#!/bin/bash

# === CONFIG ===
PUSH_SWAP="./push_swap"           # Path to your push_swap binary
VISUALIZER="visualizer_bonus/visualizer"         # Path to your visualizer binary
COUNT=100                         # Number of random integers to generate

# === STEP 1: Generate unique random numbers ===
ARGS=$(seq 1 $COUNT | shuf | tr '\n' ' ')

# === STEP 2: Run push_swap to get instructions ===
OPS=$($PUSH_SWAP $ARGS)

# Check if push_swap failed
if [ $? -ne 0 ]; then
    echo "Error: push_swap failed"
    exit 1
fi

# === STEP 3: Run the visualizer ===
echo "$OPS" | $VISUALIZER $ARGS

