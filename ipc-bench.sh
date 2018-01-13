#!/bin/csh

# First argument is ipc executable
set ipc=$1
# Second argument is csv file to output to
set csv=$2

# Overwrite any existing file with the header
echo "Measured transfer rate" > $csv

@ n = 0
# Repeat the benchmark 100 times
while ($n < 100)
	# Allow the system to calm down before running benchmark
	sleep 2
	# 16GiB transfer is found to put the system under significant
	# load for about 10 seconds, on my machine
	$ipc -i tcp -t 17179869184 2proc | awk '{print $1}' >> $csv
	@ n += 1
end

