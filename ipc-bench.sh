#!/bin/csh

# First argument is ipc executable
set ipc=$1
# Second argument is csv file to output to
set csv=$2

# Overwrite any existing file with the header
echo "Measured transfer rate" > $csv

@ n = 0
# Repeat the benchmark 250 times
while ($n < 250)
	# Allow the system to calm down before running benchmark
	sleep 2
	# 16GiB transfer is found to put the system under significant
	# load for about 10 seconds, on my machine. Reduced to 1GiB for
	# the instrumented runs which brings runtime back to ~25s per run.
	$ipc -i tcp -t 1073741824 2proc | awk '{print $1}' >> $csv
	@ n += 1
end

