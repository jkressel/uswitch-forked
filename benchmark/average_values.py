import sys

# total arguments
name = sys.argv[1]


rss = 0
pss = 0

linecnt = 0
file1 = open(name, 'r')
for line in file1:
    if linecnt == 0:
        rss += float(line)
        linecnt = 1
    else:
        pss += float(line)
        linecnt = 0
print(str(round(rss/5, 2)))
