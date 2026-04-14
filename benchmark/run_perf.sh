#!/bin/bash

#setup
rm *.perf
pkill test1-uswitch
pkill test2-uswitch
pkill test3-uswitch
pkill test4-uswitch
pkill test5-uswitch
pkill test6-uswitch
pkill test8-uswitch
echo "Start a1.jpeg"
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 10 >> t1-1-1.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 20 >> t1-1-2.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 30 >> t1-1-3.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 40 >> t1-1-4.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 50 >> t1-1-5.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 60 >> t1-1-6.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 70 >> t1-1-7.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 80 >> t1-1-8.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 90 >> t1-1-9.perf; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 1 100 >> t1-1-10.perf; done
echo "Done a1.jpeg"
echo "Start j3.jpeg"
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 10 >> t1-2-1.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 20 >> t1-2-2.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 30 >> t1-2-3.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 40 >> t1-2-4.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 50 >> t1-2-5.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 60 >> t1-2-6.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 70 >> t1-2-7.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 80 >> t1-2-8.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 90 >> t1-2-9.perf; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 1 100 >> t1-2-10.perf; done
echo "Done j3.jpeg"
echo "Start 1.jpeg"
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 10 >> t1-3-1.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 20 >> t1-3-2.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 30 >> t1-3-3.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 40 >> t1-3-4.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 50 >> t1-3-5.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 60 >> t1-3-6.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 70 >> t1-3-7.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 80 >> t1-3-8.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 90 >> t1-3-9.perf; done
for run in {1..5}; do ./test1-uswitch 1.jpeg 1 1 100 >> t1-3-10.perf; done
echo "Done 1.jpeg"
echo "Start 6mb.jpeg"
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 10 >> t1-4-1.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 20 >> t1-4-2.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 30 >> t1-4-3.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 40 >> t1-4-4.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 50 >> t1-4-5.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 60 >> t1-4-6.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 70 >> t1-4-7.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 80 >> t1-4-8.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 90 >> t1-4-9.perf; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 1 100 >> t1-4-10.perf; done
echo "Done 6mb.jpeg"
python3 average_values_perf.py t1-1-1.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-2.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-3.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-4.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-5.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-6.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-7.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-8.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-9.perf >> t1-1.avg.std.perf
python3 average_values_perf.py t1-1-10.perf >> t1-1.avg.std.perf

python3 average_values_perf.py t1-2-1.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-2.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-3.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-4.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-5.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-6.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-7.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-8.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-9.perf >> t1-2.avg.std.perf
python3 average_values_perf.py t1-2-10.perf >> t1-2.avg.std.perf

python3 average_values_perf.py t1-3-1.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-2.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-3.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-4.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-5.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-6.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-7.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-8.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-9.perf >> t1-3.avg.std.perf
python3 average_values_perf.py t1-3-10.perf >> t1-3.avg.std.perf

python3 average_values_perf.py t1-4-1.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-2.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-3.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-4.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-5.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-6.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-7.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-8.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-9.perf >> t1-4.avg.std.perf
python3 average_values_perf.py t1-4-10.perf >> t1-4.avg.std.perf
echo "Start 1.gz"
for run in {1..5}; do ./test3-uswitch 1.gz 20 10 1 >> t2-1-1.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 20 1 >> t2-1-2.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 30 1 >> t2-1-3.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 40 1 >> t2-1-4.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 50 1 >> t2-1-5.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 60 1 >> t2-1-6.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 70 1 >> t2-1-7.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 80 1 >> t2-1-8.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 90 1 >> t2-1-9.perf; done
for run in {1..5}; do ./test3-uswitch 1.gz 20 100 1 >> t2-1-10.perf; done
echo "Done 1.gz"
echo "Start 2.gz"
for run in {1..5}; do ./test3-uswitch 2.gz 20 10 1 >> t2-2-1.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 20 1 >> t2-2-2.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 30 1 >> t2-2-3.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 40 1 >> t2-2-4.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 50 1 >> t2-2-5.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 60 1 >> t2-2-6.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 70 1 >> t2-2-7.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 80 1 >> t2-2-8.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 90 1 >> t2-2-9.perf; done
for run in {1..5}; do ./test3-uswitch 2.gz 20 100 1 >> t2-2-10.perf; done
echo "Done 2.gz"
echo "Start 3.gz"
for run in {1..5}; do ./test3-uswitch 3.gz 20 10 1 >> t2-3-1.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 20 1 >> t2-3-2.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 30 1 >> t2-3-3.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 40 1 >> t2-3-4.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 50 1 >> t2-3-5.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 60 1 >> t2-3-6.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 70 1 >> t2-3-7.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 80 1 >> t2-3-8.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 90 1 >> t2-3-9.perf; done
for run in {1..5}; do ./test3-uswitch 3.gz 20 100 1 >> t2-3-10.perf; done
echo "Done 3.gz"
echo "Start j.jpeg.gz"
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 10 1 >> t2-4-1.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 20 1 >> t2-4-2.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 30 1 >> t2-4-3.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 40 1 >> t2-4-4.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 50 1 >> t2-4-5.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 60 1 >> t2-4-6.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 70 1 >> t2-4-7.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 80 1 >> t2-4-8.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 90 1 >> t2-4-9.perf; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 20 100 1 >> t2-4-10.perf; done
echo "Done j1.jpeg.gz"
python3 average_values_perf.py t2-1-1.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-2.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-3.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-4.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-5.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-6.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-7.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-8.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-9.perf >> t2-1.avg.std.perf
python3 average_values_perf.py t2-1-10.perf >> t2-1.avg.std.perf

python3 average_values_perf.py t2-2-1.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-2.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-3.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-4.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-5.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-6.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-7.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-8.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-9.perf >> t2-2.avg.std.perf
python3 average_values_perf.py t2-2-10.perf >> t2-2.avg.std.perf

python3 average_values_perf.py t2-3-1.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-2.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-3.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-4.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-5.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-6.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-7.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-8.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-9.perf >> t2-3.avg.std.perf
python3 average_values_perf.py t2-3-10.perf >> t2-3.avg.std.perf

python3 average_values_perf.py t2-4-1.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-2.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-3.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-4.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-5.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-6.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-7.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-8.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-9.perf >> t2-4.avg.std.perf
python3 average_values_perf.py t2-4-10.perf >> t2-4.avg.std.perf

echo "Start p1.png"
for run in {1..5}; do ./test2-uswitch p1.png 1 10 1 >> t3-1-1.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 20 1 >> t3-1-2.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 30 1 >> t3-1-3.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 40 1 >> t3-1-4.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 50 1 >> t3-1-5.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 60 1 >> t3-1-6.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 70 1 >> t3-1-7.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 80 1 >> t3-1-8.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 90 1 >> t3-1-9.perf; done
for run in {1..5}; do ./test2-uswitch p1.png 1 100 1 >> t3-1-10.perf; done
echo "Done p1.png"
echo "Start 2.4-MB.png"
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 10 1 >> t3-2-1.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 20 1 >> t3-2-2.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 30 1 >> t3-2-3.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 40 1 >> t3-2-4.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 50 1 >> t3-2-5.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 60 1 >> t3-2-6.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 70 1 >> t3-2-7.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 80 1 >> t3-2-8.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 90 1 >> t3-2-9.perf; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 100 1 >> t3-2-10.perf; done
echo "Done 2.4-MB.png"
echo "Start 6.3-MB.png"
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 10 1 >> t3-3-1.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 20 1 >> t3-3-2.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 30 1 >> t3-3-3.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 40 1 >> t3-3-4.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 50 1 >> t3-3-5.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 60 1 >> t3-3-6.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 70 1 >> t3-3-7.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 80 1 >> t3-3-8.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 90 1 >> t3-3-9.perf; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 100 1 >> t3-3-10.perf; done
echo "Done 6.3-MB.png"
echo "Start 11.5-MB.png"
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 10 1 >> t3-4-1.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 20 1 >> t3-4-2.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 30 1 >> t3-4-3.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 40 1 >> t3-4-4.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 50 1 >> t3-4-5.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 60 1 >> t3-4-6.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 70 1 >> t3-4-7.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 80 1 >> t3-4-8.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 90 1 >> t3-4-9.perf; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 100 1 >> t3-4-10.perf; done
echo "Start 11.5-MB.png"
python3 average_values_perf.py t3-1-1.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-2.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-3.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-4.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-5.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-6.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-7.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-8.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-9.perf >> t3-1.avg.std.perf
python3 average_values_perf.py t3-1-10.perf >> t3-1.avg.std.perf

python3 average_values_perf.py t3-2-1.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-2.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-3.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-4.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-5.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-6.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-7.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-8.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-9.perf >> t3-2.avg.std.perf
python3 average_values_perf.py t3-2-10.perf >> t3-2.avg.std.perf

python3 average_values_perf.py t3-3-1.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-2.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-3.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-4.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-5.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-6.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-7.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-8.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-9.perf >> t3-3.avg.std.perf
python3 average_values_perf.py t3-3-10.perf >> t3-3.avg.std.perf

python3 average_values_perf.py t3-4-1.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-2.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-3.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-4.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-5.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-6.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-7.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-8.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-9.perf >> t3-4.avg.std.perf
python3 average_values_perf.py t3-4-10.perf >> t3-4.avg.std.perf

echo "Start regular web page"
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 10 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 10 >> t4-1-1.perf  && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 20 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 20 >> t4-1-2.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 30 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 30 >> t4-1-3.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 40 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 40 >> t4-1-4.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 50 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 50 >> t4-1-5.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 60 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 60 >> t4-1-6.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 70 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 70 >> t4-1-7.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 80 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 80 >> t4-1-8.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 90 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 90 >> t4-1-9.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 100 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_1.sh 100 >> t4-1-10.perf && pkill test8-uswitch && sleep 2; done
echo "Done regular web page"
echo "Start big web page"
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 10 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 10 >> t4-2-1.perf  && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 20 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 20 >> t4-2-2.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 30 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 30 >> t4-2-3.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 40 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 40 >> t4-2-4.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 50 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 50 >> t4-2-5.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 60 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 60 >> t4-2-6.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 70 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 70 >> t4-2-7.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 80 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 80 >> t4-2-8.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 90 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 90 >> t4-2-9.perf && pkill test8-uswitch && sleep 2; done
for run in {1..10}; do taskset -c 0 ./test8-uswitch -p 6969 -H 0.0.0.0 -c 100 webtest/ & sleep 3 && taskset -c 1 ./run_wrk_script_2.sh 100 >> t4-2-10.perf && pkill test8-uswitch && sleep 2; done
echo "Done big web page"

python3 average_wrk.py t4-1-1.perf t4-1-2.perf t4-1-3.perf t4-1-4.perf t4-1-5.perf t4-1-6.perf t4-1-7.perf t4-1-8.perf t4-1-9.perf t4-1-10.perf > t4-1.avg.perf
python3 average_wrk.py t4-2-1.perf t4-2-2.perf t4-2-3.perf t4-2-4.perf t4-2-5.perf t4-2-6.perf t4-2-7.perf t4-2-8.perf t4-2-9.perf t4-2-10.perf > t4-2.avg.perf
#for run in {1..10}; do ./test2-uswitch p1.png 20 >> t2-1.perf & ../../wss/wss.pl $! 2 >> t2-1.mem && pkill test2-uswitch; done
#for run in {1..10}; do ./test2-uswitch p2.png 20 >> t2-2.perf & ../../wss/wss.pl $! 2 >> t2-2.mem && pkill test2-uswitch; done
#for run in {1..10}; do ./test2-uswitch p3.png 20 >> t2-3.perf & ../../wss/wss.pl $! 2 >> t2-3.mem && pkill test2-uswitch; done

#for run in {1..10}; do ./test3-uswitch 1.gz 20 >> t3-1.perf & ../../wss/wss.pl $! 2 >> t3-1.mem && pkill test3-uswitch; done
#for run in {1..10}; do ./test3-uswitch 2.gz 20 >> t3-2.perf & ../../wss/wss.pl $! 2 >> t3-2.mem && pkill test3-uswitch; done
#for run in {1..10}; do ./test3-uswitch 3.gz 20 >> t3-3.perf & ../../wss/wss.pl $! 2 >> t3-3.mem && pkill test3-uswitch; done

#for run in {1..10}; do ./test4-uswitch 20 >> t4-1.perf & ../../wss/wss.pl $! 2 >> t4-1.mem && pkill test4-uswitch; done

#for run in {1..10}; do ./test5-uswitch 20 1 >> t5-1.perf & ../../wss/wss.pl $! 2 >> t5-1.mem && pkill test5-uswitch; done


#for run in {1..10}; do ./test6-uswitch f1.txt 20 20 >> t6-1.perf & ../../wss/wss.pl $! 2 >> t6-1.mem && pkill test6-uswitch; done
#for run in {1..10}; do ./test6-uswitch f2.txt 20 20 >> t6-2.perf & ../../wss/wss.pl $! 2 >> t6-2.mem && pkill test6-uswitch; done
#for run in {1..10}; do ./test6-uswitch f3.txt 20 20 >> t6-3.perf & ../../wss/wss.pl $! 2 >> t6-3.mem && pkill test6-uswitch; done
#for run in {1..10}; do ./test6-uswitch f4.txt 20 20 >> t6-4.perf & ../../wss/wss.pl $! 2 >> t6-4.mem && pkill test6-uswitch; done
#for run in {1..10}; do ./test6-uswitch f5.txt 20 20 >> t6-5.perf & ../../wss/wss.pl $! 2 >> t6-5.mem && pkill test6-uswitch; done
