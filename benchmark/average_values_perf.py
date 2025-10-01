import sys

# total arguments
name = sys.argv[1]


total = 0

linecnt = 0
file1 = open(name, 'r')
for line in file1:
    total += float(line)
    linecnt = 0
print(str(round(total/5, 2)))
