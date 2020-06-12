import re
import sys

input_file = sys.argv[1]

 

ID = sys.argv[2]
Cl8 = []
Cl18 = []
x=0
with open(input_file) as f:
    for row in f:
        if x==0:
            x=1
            pass
        else:
            row_s = row.split("\t")
            cl = int(row_s[2])
            if row_s[0] == ID:
                if cl == 8:
                    Cl8.append(row_s[1])
                elif cl == 18:
                    Cl18.append(row_s[1])
            else:
                if len(Cl8)>0 and len(Cl18)>0:
                    distances = []
                    for x in set(Cl8):
                        for y in set(Cl18):
                            distances.append(abs(float(x)-float(y)))
                    print(ID, min(distances))
                else:
                    print(ID, "Not Both")
                ID = row_s[0]
                Cl8 = []
                Cl18 = []