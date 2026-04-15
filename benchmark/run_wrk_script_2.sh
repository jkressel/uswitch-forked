#!/bin/bash

# Check if the user provided the number of iterations
if [ -z "$1" ]; then
  echo "Usage: $0 <number_of_ports>"
  echo "Example: $0 20"
  exit 1
fi

# Assign the input argument to a variable
NUM_PORTS=$1
START_PORT=6969

# Validate that the input is a positive integer
if ! [[ "$NUM_PORTS" =~ ^[0-9]+$ ]]; then
  echo "Error: Please provide a valid positive number."
  exit 1
fi

# Calculate the end port for a quick summary message
END_PORT=$((START_PORT + NUM_PORTS - 1))
echo "Starting wrk tests from port $START_PORT to $END_PORT ($NUM_PORTS total)..."
echo "======================================================================="

# Loop through the specified number of times
for (( i=0; i<NUM_PORTS; i++ ))
do
  CURRENT_PORT=$((START_PORT + i))
  
  echo "Running wrk on port $CURRENT_PORT..."
  wrk -d 5 -t 1 -c 100 "http://0.0.0.0:${CURRENT_PORT}/bigpage.html"
  
  echo "-----------------------------------------------------------------------"
done

echo "All tests completed!"
