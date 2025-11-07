#!/bin/bash

#setup
rm *.mem
rm *.perf
pkill test1-uswitch
pkill test2-uswitch
pkill test3-uswitch
pkill test4-uswitch
pkill test5-uswitch
pkill test6-uswitch
pkill test8-uswitch

for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 10 >> t1-1-1.perf & ../../wss/wss.pl $! 3 >> t1-1-1.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 20 >> t1-1-2.perf & ../../wss/wss.pl $! 5 >> t1-1-2.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 30 >> t1-1-3.perf & ../../wss/wss.pl $! 6 >> t1-1-3.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 40 >> t1-1-4.perf & ../../wss/wss.pl $! 8 >> t1-1-4.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 50 >> t1-1-5.perf & ../../wss/wss.pl $! 8 >> t1-1-5.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 60 >> t1-1-6.perf & ../../wss/wss.pl $! 10 >> t1-1-6.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 70 >> t1-1-7.perf & ../../wss/wss.pl $! 12 >> t1-1-7.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 80 >> t1-1-8.perf & ../../wss/wss.pl $! 13 >> t1-1-8.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 90 >> t1-1-9.perf & ../../wss/wss.pl $! 14 >> t1-1-9.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch a1.jpeg 1 0 100 >> t1-1-10.perf & ../../wss/wss.pl $! 15 >> t1-1-10.mem && pkill test1-uswitch; done


for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 10 >> t1-2-1.perf & ../../wss/wss.pl $! 3 >> t1-2-1.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 20 >> t1-2-2.perf & ../../wss/wss.pl $! 5 >> t1-2-2.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 30 >> t1-2-3.perf & ../../wss/wss.pl $! 6 >> t1-2-3.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 40 >> t1-2-4.perf & ../../wss/wss.pl $! 8 >> t1-2-4.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 50 >> t1-2-5.perf & ../../wss/wss.pl $! 8 >> t1-2-5.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 60 >> t1-2-6.perf & ../../wss/wss.pl $! 9 >> t1-2-6.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 70 >> t1-2-7.perf & ../../wss/wss.pl $! 12 >> t1-2-7.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 80 >> t1-2-8.perf & ../../wss/wss.pl $! 13 >> t1-2-8.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 90 >> t1-2-9.perf & ../../wss/wss.pl $! 14 >> t1-2-9.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch j3.jpeg 1 0 100 >> t1-2-10.perf & ../../wss/wss.pl $! 15 >> t1-2-10.mem && pkill test1-uswitch; done


for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 10 >> t1-3-1.perf & ../../wss/wss.pl $! 3 >> t1-3-1.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 20 >> t1-3-2.perf & ../../wss/wss.pl $! 6 >> t1-3-2.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 30 >> t1-3-3.perf & ../../wss/wss.pl $! 8 >> t1-3-3.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 40 >> t1-3-4.perf & ../../wss/wss.pl $! 8 >> t1-3-4.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 50 >> t1-3-5.perf & ../../wss/wss.pl $! 9 >> t1-3-5.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 60 >> t1-3-6.perf & ../../wss/wss.pl $! 12 >> t1-3-6.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 70 >> t1-3-7.perf & ../../wss/wss.pl $! 13 >> t1-3-7.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 80 >> t1-3-8.perf & ../../wss/wss.pl $! 14 >> t1-3-8.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 90 >> t1-3-9.perf & ../../wss/wss.pl $! 15 >> t1-3-9.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch Free_Test_Data_1MB_JPG.jpg 1 0 100 >> t1-3-10.perf & ../../wss/wss.pl $! 16 >> t1-3-10.mem && pkill test1-uswitch; done


for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 10 >> t1-4-1.perf & ../../wss/wss.pl $! 3 >> t1-4-1.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 20 >> t1-4-2.perf & ../../wss/wss.pl $! 6 >> t1-4-2.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 30 >> t1-4-3.perf & ../../wss/wss.pl $! 10 >> t1-4-3.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 40 >> t1-4-4.perf & ../../wss/wss.pl $! 10 >> t1-4-4.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 50 >> t1-4-5.perf & ../../wss/wss.pl $! 11 >> t1-4-5.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 60 >> t1-4-6.perf & ../../wss/wss.pl $! 12 >> t1-4-6.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 70 >> t1-4-7.perf & ../../wss/wss.pl $! 13 >> t1-4-7.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 80 >> t1-4-8.perf & ../../wss/wss.pl $! 14 >> t1-4-8.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 90 >> t1-4-9.perf & ../../wss/wss.pl $! 15 >> t1-4-9.mem && pkill test1-uswitch; done
for run in {1..5}; do ./test1-uswitch 6mb.jpeg 1 0 100 >> t1-4-10.perf & ../../wss/wss.pl $! 17 >> t1-4-10.mem && pkill test1-uswitch; done

python3 average_values.py t1-1-1.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-2.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-3.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-4.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-5.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-6.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-7.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-8.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-9.mem >> t1-1.avg.std.mem
python3 average_values.py t1-1-10.mem >> t1-1.avg.std.mem

python3 average_values.py t1-2-1.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-2.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-3.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-4.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-5.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-6.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-7.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-8.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-9.mem >> t1-2.avg.std.mem
python3 average_values.py t1-2-10.mem >> t1-2.avg.std.mem

python3 average_values.py t1-3-1.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-2.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-3.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-4.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-5.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-6.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-7.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-8.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-9.mem >> t1-3.avg.std.mem
python3 average_values.py t1-3-10.mem >> t1-3.avg.std.mem

python3 average_values.py t1-4-1.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-2.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-3.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-4.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-5.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-6.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-7.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-8.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-9.mem >> t1-4.avg.std.mem
python3 average_values.py t1-4-10.mem >> t1-4.avg.std.mem


for run in {1..5}; do ./test3-uswitch 1.gz 100 10 0 >> t2-1-1.perf & ../../wss/wss.pl $! 5 >> t2-1-1.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 20 0 >> t2-1-2.perf & ../../wss/wss.pl $! 10 >> t2-1-2.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 30 0 >> t2-1-3.perf & ../../wss/wss.pl $! 10 >> t2-1-3.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 40 0 >> t2-1-4.perf & ../../wss/wss.pl $! 15 >> t2-1-4.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 50 0 >> t2-1-5.perf & ../../wss/wss.pl $! 20 >> t2-1-5.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 60 0 >> t2-1-6.perf & ../../wss/wss.pl $! 25 >> t2-1-6.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 70 0 >> t2-1-7.perf & ../../wss/wss.pl $! 30 >> t2-1-7.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 80 0 >> t2-1-8.perf & ../../wss/wss.pl $! 35 >> t2-1-8.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 90 0 >> t2-1-9.perf & ../../wss/wss.pl $! 40 >> t2-1-9.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 1.gz 100 100 0 >> t2-1-10.perf & ../../wss/wss.pl $! 50 >> t2-1-10.mem && pkill test3-uswitch; done

for run in {1..5}; do ./test3-uswitch 2.gz 100 10 0 >> t2-2-1.perf & ../../wss/wss.pl $! 5 >> t2-2-1.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 20 0 >> t2-2-2.perf & ../../wss/wss.pl $! 10 >> t2-2-2.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 30 0 >> t2-2-3.perf & ../../wss/wss.pl $! 15 >> t2-2-3.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 40 0 >> t2-2-4.perf & ../../wss/wss.pl $! 20 >> t2-2-4.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 50 0 >> t2-2-5.perf & ../../wss/wss.pl $! 25 >> t2-2-5.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 60 0 >> t2-2-6.perf & ../../wss/wss.pl $! 30 >> t2-2-6.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 70 0 >> t2-2-7.perf & ../../wss/wss.pl $! 35 >> t2-2-7.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 80 0 >> t2-2-8.perf & ../../wss/wss.pl $! 40 >> t2-2-8.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 90 0 >> t2-2-9.perf & ../../wss/wss.pl $! 45 >> t2-2-9.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 2.gz 100 100 0 >> t2-2-10.perf & ../../wss/wss.pl $! 50 >> t2-2-10.mem && pkill test3-uswitch; done

for run in {1..5}; do ./test3-uswitch 3.gz 100 10 0 >> t2-3-1.perf & ../../wss/wss.pl $! 5 >> t2-3-1.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 20 0 >> t2-3-2.perf & ../../wss/wss.pl $! 10 >> t2-3-2.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 30 0 >> t2-3-3.perf & ../../wss/wss.pl $! 15 >> t2-3-3.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 40 0 >> t2-3-4.perf & ../../wss/wss.pl $! 20 >> t2-3-4.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 50 0 >> t2-3-5.perf & ../../wss/wss.pl $! 25 >> t2-3-5.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 60 0 >> t2-3-6.perf & ../../wss/wss.pl $! 30 >> t2-3-6.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 70 0 >> t2-3-7.perf & ../../wss/wss.pl $! 35 >> t2-3-7.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 80 0 >> t2-3-8.perf & ../../wss/wss.pl $! 40 >> t2-3-8.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 90 0 >> t2-3-9.perf & ../../wss/wss.pl $! 45 >> t2-3-9.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch 3.gz 100 100 0 >> t2-3-10.perf & ../../wss/wss.pl $! 50 >> t2-3-10.mem && pkill test3-uswitch; done

for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 10 0 >> t2-4-1.perf & ../../wss/wss.pl $! 5 >> t2-4-1.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 20 0 >> t2-4-2.perf & ../../wss/wss.pl $! 10 >> t2-4-2.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 30 0 >> t2-4-3.perf & ../../wss/wss.pl $! 15 >> t2-4-3.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 40 0 >> t2-4-4.perf & ../../wss/wss.pl $! 20 >> t2-4-4.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 50 0 >> t2-4-5.perf & ../../wss/wss.pl $! 25 >> t2-4-5.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 60 0 >> t2-4-6.perf & ../../wss/wss.pl $! 30 >> t2-4-6.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 70 0 >> t2-4-7.perf & ../../wss/wss.pl $! 35 >> t2-4-7.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 80 0 >> t2-4-8.perf & ../../wss/wss.pl $! 40 >> t2-4-8.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 90 0 >> t2-4-9.perf & ../../wss/wss.pl $! 45 >> t2-4-9.mem && pkill test3-uswitch; done
for run in {1..5}; do ./test3-uswitch j1.jpeg.gz 100 100 0 >> t2-4-10.perf & ../../wss/wss.pl $! 50 >> t2-4-10.mem && pkill test3-uswitch; done
python3 average_values.py t2-1-1.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-2.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-3.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-4.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-5.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-6.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-7.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-8.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-9.mem >> t2-1.avg.std.mem
python3 average_values.py t2-1-10.mem >> t2-1.avg.std.mem

python3 average_values.py t2-2-1.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-2.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-3.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-4.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-5.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-6.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-7.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-8.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-9.mem >> t2-2.avg.std.mem
python3 average_values.py t2-2-10.mem >> t2-2.avg.std.mem

python3 average_values.py t2-3-1.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-2.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-3.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-4.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-5.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-6.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-7.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-8.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-9.mem >> t2-3.avg.std.mem
python3 average_values.py t2-3-10.mem >> t2-3.avg.std.mem

python3 average_values.py t2-4-1.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-2.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-3.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-4.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-5.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-6.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-7.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-8.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-9.mem >> t2-4.avg.std.mem
python3 average_values.py t2-4-10.mem >> t2-4.avg.std.mem


for run in {1..5}; do ./test2-uswitch p3.png 1 10 0 >> t3-1-1.perf & ../../wss/wss.pl $! 3 >> t3-1-1.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 20 0 >> t3-1-2.perf & ../../wss/wss.pl $! 8 >> t3-1-2.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 30 0 >> t3-1-3.perf & ../../wss/wss.pl $! 9 >> t3-1-3.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 40 0 >> t3-1-4.perf & ../../wss/wss.pl $! 10 >> t3-1-4.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 50 0 >> t3-1-5.perf & ../../wss/wss.pl $! 11 >> t3-1-5.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 60 0 >> t3-1-6.perf & ../../wss/wss.pl $! 12 >> t3-1-6.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 70 0 >> t3-1-7.perf & ../../wss/wss.pl $! 13 >> t3-1-7.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 80 0 >> t3-1-8.perf & ../../wss/wss.pl $! 14 >> t3-1-8.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 90 0 >> t3-1-9.perf & ../../wss/wss.pl $! 15 >> t3-1-9.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch p3.png 1 100 0 >> t3-1-10.perf & ../../wss/wss.pl $! 17 >> t3-1-10.mem && pkill test2-uswitch; done

for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 10 0 >> t3-2-1.perf & ../../wss/wss.pl $! 4 >> t3-2-1.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 20 0 >> t3-2-2.perf & ../../wss/wss.pl $! 8 >> t3-2-2.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 30 0 >> t3-2-3.perf & ../../wss/wss.pl $! 9 >> t3-2-3.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 40 0 >> t3-2-4.perf & ../../wss/wss.pl $! 10 >> t3-2-4.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 50 0 >> t3-2-5.perf & ../../wss/wss.pl $! 11 >> t3-2-5.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 60 0 >> t3-2-6.perf & ../../wss/wss.pl $! 12 >> t3-2-6.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 70 0 >> t3-2-7.perf & ../../wss/wss.pl $! 13 >> t3-2-7.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 80 0 >> t3-2-8.perf & ../../wss/wss.pl $! 14 >> t3-2-8.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 90 0 >> t3-2-9.perf & ../../wss/wss.pl $! 15 >> t3-2-9.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 2.4-MB.png 1 100 0 >> t3-2-10.perf & ../../wss/wss.pl $! 17 >> t3-2-10.mem && pkill test2-uswitch; done

for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 10 0 >> t3-3-1.perf & ../../wss/wss.pl $! 4 >> t3-3-1.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 20 0 >> t3-3-2.perf & ../../wss/wss.pl $! 8 >> t3-3-2.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 30 0 >> t3-3-3.perf & ../../wss/wss.pl $! 9 >> t3-3-3.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 40 0 >> t3-3-4.perf & ../../wss/wss.pl $! 10 >> t3-3-4.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 50 0 >> t3-3-5.perf & ../../wss/wss.pl $! 11 >> t3-3-5.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 60 0 >> t3-3-6.perf & ../../wss/wss.pl $! 12 >> t3-3-6.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 70 0 >> t3-3-7.perf & ../../wss/wss.pl $! 13 >> t3-3-7.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 80 0 >> t3-3-8.perf & ../../wss/wss.pl $! 14 >> t3-3-8.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 90 0 >> t3-3-9.perf & ../../wss/wss.pl $! 15 >> t3-3-9.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 6.3-MB.png 1 100 0 >> t3-3-10.perf & ../../wss/wss.pl $! 17 >> t3-3-10.mem && pkill test2-uswitch; done

for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 10 0 >> t3-4-1.perf & ../../wss/wss.pl $! 4 >> t3-4-1.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 20 0 >> t3-4-2.perf & ../../wss/wss.pl $! 8 >> t3-4-2.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 30 0 >> t3-4-3.perf & ../../wss/wss.pl $! 9 >> t3-4-3.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 40 0 >> t3-4-4.perf & ../../wss/wss.pl $! 10 >> t3-4-4.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 50 0 >> t3-4-5.perf & ../../wss/wss.pl $! 11 >> t3-4-5.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 60 0 >> t3-4-6.perf & ../../wss/wss.pl $! 12 >> t3-4-6.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 70 0 >> t3-4-7.perf & ../../wss/wss.pl $! 13 >> t3-4-7.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 80 0 >> t3-4-8.perf & ../../wss/wss.pl $! 14 >> t3-4-8.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 90 0 >> t3-4-9.perf & ../../wss/wss.pl $! 15 >> t3-4-9.mem && pkill test2-uswitch; done
for run in {1..5}; do ./test2-uswitch 11.5-MB.png 1 100 0 >> t3-4-10.perf & ../../wss/wss.pl $! 17 >> t3-4-10.mem && pkill test2-uswitch; done


python3 average_values.py t3-1-1.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-2.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-3.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-4.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-5.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-6.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-7.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-8.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-9.mem >> t3-1.avg.std.mem
python3 average_values.py t3-1-10.mem >> t3-1.avg.std.mem

python3 average_values.py t3-2-1.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-2.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-3.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-4.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-5.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-6.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-7.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-8.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-9.mem >> t3-2.avg.std.mem
python3 average_values.py t3-2-10.mem >> t3-2.avg.std.mem

python3 average_values.py t3-3-1.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-2.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-3.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-4.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-5.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-6.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-7.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-8.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-9.mem >> t3-3.avg.std.mem
python3 average_values.py t3-3-10.mem >> t3-3.avg.std.mem

python3 average_values.py t3-4-1.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-2.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-3.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-4.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-5.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-6.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-7.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-8.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-9.mem >> t3-4.avg.std.mem
python3 average_values.py t3-4-10.mem >> t3-4.avg.std.mem


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
