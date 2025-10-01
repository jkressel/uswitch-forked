import sys

# total arguments
name = sys.argv[1]


size = []
cnt = []
dsize = []
dcnt = []

for i in range(0,16):
    size.append(0)
    cnt.append(0)
    dsize.append(0)
    dcnt.append(0)

linecnt = 0
file1 = open(name, 'r')
for line in file1:
    split_line = line.split(",")
    index = int(split_line[0].strip())
    size[index] += int(split_line[1].split(":")[1].strip())
    cnt[index] += int(split_line[2].split(":")[1].strip())
    dsize[index] += int(split_line[3].split(":")[1].strip())
    dcnt[index] += int(split_line[4].split(":")[1].strip())

for i in range(0, 16):
    print(str(int(size[i]/10)))
    print(str(int(cnt[i]/10)))
    print(str(int(dsize[i]/10)))
    print(str(int(dcnt[i]/10)))
