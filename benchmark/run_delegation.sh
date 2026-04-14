#!/bin/bash

rm *.del

for run in {1..10}; do ./testtest-uswitch j1.jpeg.bz2 20 0 1 >> d1.out  2>> d1.del; done
for run in {1..10}; do ./magicex magicexdir 1 1 1 >> d2.out  2>> d2.del; done

#python3 average_values_delegation.py d1.del > d1.avg
#python3 average_values_delegation.py d2.del > d2.avg

