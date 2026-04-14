#!/bin/bash

#setup

rm -rf memexdir
pkill memex
mkdir memexdir

sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 5/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 1 >> memexdir/1-1.perf & ../../wss/wss.pl $! 2 >> memexdir/1-1.mem && pkill memex; done
for run in {1..5}; do ./memex 10 1 >> memexdir/10-1.perf & ../../wss/wss.pl $! 2 >> memexdir/10-1.mem && pkill memex; done
for run in {1..5}; do ./memex 100 1 >> memexdir/100-1.perf & ../../wss/wss.pl $! 2 >> memexdir/100-1.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 1 >> memexdir/1000-1.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-1.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 1 >> memexdir/10000-1.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-1.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 1 >> memexdir/100000-1.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-1.mem && pkill memex; done


sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 6/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 2 >> memexdir/1-2.perf & ../../wss/wss.pl $! 2 >> memexdir/1-2.mem && pkill memex; done
for run in {1..5}; do ./memex 10 2 >> memexdir/10-2.perf & ../../wss/wss.pl $! 2 >> memexdir/10-2.mem && pkill memex; done
for run in {1..5}; do ./memex 100 2 >> memexdir/100-2.perf & ../../wss/wss.pl $! 2 >> memexdir/100-2.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 2 >> memexdir/1000-2.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-2.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 2 >> memexdir/10000-2.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-2.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 2 >> memexdir/100000-2.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-2.mem && pkill memex; done


sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 7/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 3 >> memexdir/1-3.perf & ../../wss/wss.pl $! 2 >> memexdir/1-3.mem && pkill memex; done
for run in {1..5}; do ./memex 10 3 >> memexdir/10-3.perf & ../../wss/wss.pl $! 2 >> memexdir/10-3.mem && pkill memex; done
for run in {1..5}; do ./memex 100 3 >> memexdir/100-3.perf & ../../wss/wss.pl $! 2 >> memexdir/100-3.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 3 >> memexdir/1000-3.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-3.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 3 >> memexdir/10000-3.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-3.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 3 >> memexdir/100000-3.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-3.mem && pkill memex; done

sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 8/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make


for run in {1..5}; do ./memex 1 4 >> memexdir/1-4.perf & ../../wss/wss.pl $! 2 >> memexdir/1-4.mem && pkill memex; done
for run in {1..5}; do ./memex 10 4 >> memexdir/10-4.perf & ../../wss/wss.pl $! 2 >> memexdir/10-4.mem && pkill memex; done
for run in {1..5}; do ./memex 100 4 >> memexdir/100-4.perf & ../../wss/wss.pl $! 2 >> memexdir/100-4.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 4 >> memexdir/1000-4.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-4.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 4 >> memexdir/10000-4.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-4.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 4 >> memexdir/100000-4.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-4.mem && pkill memex; done


sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 9/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 5 >> memexdir/1-5.perf & ../../wss/wss.pl $! 2 >> memexdir/1-5.mem && pkill memex; done
for run in {1..5}; do ./memex 10 5 >> memexdir/10-5.perf & ../../wss/wss.pl $! 2 >> memexdir/10-5.mem && pkill memex; done
for run in {1..5}; do ./memex 100 5 >> memexdir/100-5.perf & ../../wss/wss.pl $! 2 >> memexdir/100-5.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 5 >> memexdir/1000-5.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-5.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 5 >> memexdir/10000-5.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-5.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 5 >> memexdir/100000-5.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-5.mem && pkill memex; done


sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 10/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 6 >> memexdir/1-6.perf & ../../wss/wss.pl $! 2 >> memexdir/1-6.mem && pkill memex; done
for run in {1..5}; do ./memex 10 6 >> memexdir/10-6.perf & ../../wss/wss.pl $! 2 >> memexdir/10-6.mem && pkill memex; done
for run in {1..5}; do ./memex 100 6 >> memexdir/100-6.perf & ../../wss/wss.pl $! 2 >> memexdir/100-6.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 6 >> memexdir/1000-6.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-6.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 6 >> memexdir/10000-6.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-6.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 6 >> memexdir/100000-6.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-6.mem && pkill memex; done


sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 11/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 7 >> memexdir/1-7.perf & ../../wss/wss.pl $! 2 >> memexdir/1-7.mem && pkill memex; done
for run in {1..5}; do ./memex 10 7 >> memexdir/10-7.perf & ../../wss/wss.pl $! 2 >> memexdir/10-7.mem && pkill memex; done
for run in {1..5}; do ./memex 100 7 >> memexdir/100-7.perf & ../../wss/wss.pl $! 2 >> memexdir/100-7.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 7 >> memexdir/1000-7.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-7.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 7 >> memexdir/10000-7.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-7.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 7 >> memexdir/100000-7.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-7.mem && pkill memex; done


sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 12/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 8 >> memexdir/1-8.perf & ../../wss/wss.pl $! 2 >> memexdir/1-8.mem && pkill memex; done
for run in {1..5}; do ./memex 10 8 >> memexdir/10-8.perf & ../../wss/wss.pl $! 2 >> memexdir/10-8.mem && pkill memex; done
for run in {1..5}; do ./memex 100 8 >> memexdir/100-8.perf & ../../wss/wss.pl $! 2 >> memexdir/100-8.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 8 >> memexdir/1000-8.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-8.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 8 >> memexdir/10000-8.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-8.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 8 >> memexdir/100000-8.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-8.mem && pkill memex; done

sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 13/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make


for run in {1..5}; do ./memex 1 9 >> memexdir/1-9.perf & ../../wss/wss.pl $! 2 >> memexdir/1-9.mem && pkill memex; done
for run in {1..5}; do ./memex 10 9 >> memexdir/10-9.perf & ../../wss/wss.pl $! 2 >> memexdir/10-9.mem && pkill memex; done
for run in {1..5}; do ./memex 100 9 >> memexdir/100-9.perf & ../../wss/wss.pl $! 2 >> memexdir/100-9.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 9 >> memexdir/1000-9.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-9.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 9 >> memexdir/10000-9.perf & ../../wss/wss.pl $! 3 >> memexdir/10000-9.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 9 >> memexdir/100000-9.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-9.mem && pkill memex; done

sed -i 's/.*#define MAX_DOMAINS.*/#define MAX_DOMAINS 14/' ../../allocator/SlimGuard/slimguard-standalone.c
cd ../rlbox_uswitch
make clean && make
cd ../benchmark
rm memex
make

for run in {1..5}; do ./memex 1 10 >> memexdir/1-10.perf & ../../wss/wss.pl $! 2 >> memexdir/1-10.mem && pkill memex; done
for run in {1..5}; do ./memex 10 10 >> memexdir/10-10.perf & ../../wss/wss.pl $! 2 >> memexdir/10-10.mem && pkill memex; done
for run in {1..5}; do ./memex 100 10 >> memexdir/100-10.perf & ../../wss/wss.pl $! 2 >> memexdir/100-10.mem && pkill memex; done
for run in {1..5}; do ./memex 1000 10 >> memexdir/1000-10.perf & ../../wss/wss.pl $! 2 >> memexdir/1000-10.mem && pkill memex; done
for run in {1..5}; do ./memex 10000 10 >> memexdir/10000-10.perf & ../../wss/wss.pl $! 4 >> memexdir/10000-10.mem && pkill memex; done
for run in {1..5}; do ./memex 100000 10 >> memexdir/100000-10.perf & ../../wss/wss.pl $! 7 >> memexdir/100000-10.mem && pkill memex; done

python3 average_values.py memexdir/1-1.mem >> memexdir/t1.avg.std.mem
python3 average_values.py memexdir/10-1.mem >> memexdir/t1.avg.std.mem
python3 average_values.py memexdir/100-1.mem >> memexdir/t1.avg.std.mem
python3 average_values.py memexdir/1000-1.mem >> memexdir/t1.avg.std.mem
python3 average_values.py memexdir/10000-1.mem >> memexdir/t1.avg.std.mem
python3 average_values.py memexdir/100000-1.mem >> memexdir/t1.avg.std.mem

python3 average_values.py memexdir/1-2.mem >> memexdir/t2.avg.std.mem
python3 average_values.py memexdir/10-2.mem >> memexdir/t2.avg.std.mem
python3 average_values.py memexdir/100-2.mem >> memexdir/t2.avg.std.mem
python3 average_values.py memexdir/1000-2.mem >> memexdir/t2.avg.std.mem
python3 average_values.py memexdir/10000-2.mem >> memexdir/t2.avg.std.mem
python3 average_values.py memexdir/100000-2.mem >> memexdir/t2.avg.std.mem

python3 average_values.py memexdir/1-3.mem >> memexdir/t3.avg.std.mem
python3 average_values.py memexdir/10-3.mem >> memexdir/t3.avg.std.mem
python3 average_values.py memexdir/100-3.mem >> memexdir/t3.avg.std.mem
python3 average_values.py memexdir/1000-3.mem >> memexdir/t3.avg.std.mem
python3 average_values.py memexdir/10000-3.mem >> memexdir/t3.avg.std.mem
python3 average_values.py memexdir/100000-3.mem >> memexdir/t3.avg.std.mem

python3 average_values.py memexdir/1-4.mem >> memexdir/t4.avg.std.mem
python3 average_values.py memexdir/10-4.mem >> memexdir/t4.avg.std.mem
python3 average_values.py memexdir/100-4.mem >> memexdir/t4.avg.std.mem
python3 average_values.py memexdir/1000-4.mem >> memexdir/t4.avg.std.mem
python3 average_values.py memexdir/10000-4.mem >> memexdir/t4.avg.std.mem
python3 average_values.py memexdir/100000-4.mem >> memexdir/t4.avg.std.mem

python3 average_values.py memexdir/1-5.mem >> memexdir/t5.avg.std.mem
python3 average_values.py memexdir/10-5.mem >> memexdir/t5.avg.std.mem
python3 average_values.py memexdir/100-5.mem >> memexdir/t5.avg.std.mem
python3 average_values.py memexdir/1000-5.mem >> memexdir/t5.avg.std.mem
python3 average_values.py memexdir/10000-5.mem >> memexdir/t5.avg.std.mem
python3 average_values.py memexdir/100000-5.mem >> memexdir/t5.avg.std.mem

python3 average_values.py memexdir/1-6.mem >> memexdir/t6.avg.std.mem
python3 average_values.py memexdir/10-6.mem >> memexdir/t6.avg.std.mem
python3 average_values.py memexdir/100-6.mem >> memexdir/t6.avg.std.mem
python3 average_values.py memexdir/1000-6.mem >> memexdir/t6.avg.std.mem
python3 average_values.py memexdir/10000-6.mem >> memexdir/t6.avg.std.mem
python3 average_values.py memexdir/100000-6.mem >> memexdir/t6.avg.std.mem

python3 average_values.py memexdir/1-7.mem >> memexdir/t7.avg.std.mem
python3 average_values.py memexdir/10-7.mem >> memexdir/t7.avg.std.mem
python3 average_values.py memexdir/100-7.mem >> memexdir/t7.avg.std.mem
python3 average_values.py memexdir/1000-7.mem >> memexdir/t7.avg.std.mem
python3 average_values.py memexdir/10000-7.mem >> memexdir/t7.avg.std.mem
python3 average_values.py memexdir/100000-7.mem >> memexdir/t7.avg.std.mem

python3 average_values.py memexdir/1-8.mem >> memexdir/t8.avg.std.mem
python3 average_values.py memexdir/10-8.mem >> memexdir/t8.avg.std.mem
python3 average_values.py memexdir/100-8.mem >> memexdir/t8.avg.std.mem
python3 average_values.py memexdir/1000-8.mem >> memexdir/t8.avg.std.mem
python3 average_values.py memexdir/10000-8.mem >> memexdir/t8.avg.std.mem
python3 average_values.py memexdir/100000-8.mem >> memexdir/t8.avg.std.mem

python3 average_values.py memexdir/1-9.mem >> memexdir/t9.avg.std.mem
python3 average_values.py memexdir/10-9.mem >> memexdir/t9.avg.std.mem
python3 average_values.py memexdir/100-9.mem >> memexdir/t9.avg.std.mem
python3 average_values.py memexdir/1000-9.mem >> memexdir/t9.avg.std.mem
python3 average_values.py memexdir/10000-9.mem >> memexdir/t9.avg.std.mem
python3 average_values.py memexdir/100000-9.mem >> memexdir/t9.avg.std.mem

python3 average_values.py memexdir/1-10.mem >> memexdir/t10.avg.std.mem
python3 average_values.py memexdir/10-10.mem >> memexdir/t10.avg.std.mem
python3 average_values.py memexdir/100-10.mem >> memexdir/t10.avg.std.mem
python3 average_values.py memexdir/1000-10.mem >> memexdir/t10.avg.std.mem
python3 average_values.py memexdir/10000-10.mem >> memexdir/t10.avg.std.mem
python3 average_values.py memexdir/100000-10.mem >> memexdir/t10.avg.std.mem
