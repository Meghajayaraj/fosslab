#!/bin/bash

pdftotext -layout -nopgbrk result_MDL1.pdf result_MDL1.txt
pdftotext -layout -nopgbrk result_MDL2.pdf result_MDL2.txt
grep -A 1 "MDL16CS" result_MDL1.txt > CS1.txt
grep -A 1 "MDL16CS" result_MDL2.txt > CS2.txt


sed -i 's/--//g' CS1.txt
sed -i 's/,/ /g' CS1.txt
sed -i 's/MA101//g' CS1.txt
sed -i 's/PH100//g' CS1.txt
sed -i 's/BE110//g' CS1.txt
sed -i 's/BE103//g' CS1.txt
sed -i 's/EE100//g' CS1.txt
sed -i 's/PH110//g' CS1.txt
sed -i 's/EE110//g' CS1.txt
sed -i 's/\<CS110\>//g' CS1.txt
sed -i 's/BE10105//g' CS1.txt
sed -i 's/            //g' CS1.txt
sed -i 's/      / /g' CS1.txt

sed -i 's/(O)/10/g' CS1.txt
sed -i 's/(A+)/9/g' CS1.txt
sed -i 's/(A)/8.5/g' CS1.txt
sed -i 's/(B+)/8/g' CS1.txt
sed -i 's/(B)/7/g' CS1.txt
sed -i 's/(C)/6/g' CS1.txt
sed -i 's/(P)/5/g' CS1.txt
sed -i 's/(F)/0/g' CS1.txt

tr -d "\n" <CS1.txt>RESULT_CS1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' RESULT_CS1.txt
 
awk '{ print $1 " " ($2*4 +$3*4 + $4*3 + $5*3 + $6*3 + $7*3+ $8+ $9 + $(10))/23 }' RESULT_CS1.txt > S1.txt



sed -i 's/--//g' CS2.txt
sed -i 's/,/ /g' CS2.txt
sed -i 's/CY100//g' CS2.txt
sed -i 's/EC100//g' CS2.txt
sed -i 's/BE100//g' CS2.txt
sed -i 's/CY110//g' CS2.txt	
sed -i 's/EC110//g' CS2.txt
sed -i 's/MA102//g' CS2.txt
sed -i 's/BE102//g' CS2.txt
sed -i 's/\<CS120\>//g' CS2.txt
sed -i 's/\<CS100\>//g' CS2.txt
sed -i 's/     //g' CS2.txt
sed -i 's/             //g' CS2.txt


sed -i 's/(O)/10/g' CS2.txt
sed -i 's/(A+)/9/g' CS2.txt
sed -i 's/(A)/8.5/g' CS2.txt
sed -i 's/(B+)/8/g' CS2.txt
sed -i 's/(B)/7/g' CS2.txt
sed -i 's/(C)/6/g' CS2.txt
sed -i 's/(P)/5/g' CS2.txt
sed -i 's/(F)/0/g' CS2.txt

tr -d "\n" <CS2.txt>RESULT_CS2.txt
sed -i 's/MDL16CS/\nMDL16CS/g' RESULT_CS2.txt
awk '{ print $1 " " ($2*4 +$3*4 + $4*3 + $5*1 + $6*1 + $7*4+ $8*3+ $9*3 + $(10))/24 }' RESULT_CS2.txt > S2.txt

$(join -1 1 -2 1 S1.txt S2.txt > RESULTS12.txt)
awk '{ print $1 " " ($2*23 + $3*24)/(23+24) }' RESULTS12.txt > S12.txt

$(join --nocheck-order -1 6 -2 1 c4b.txt RESULTS12.txt > c4_sgpa.txt)
$(join --nocheck-order -1 1 -2 1 c4_sgpa.txt S12.txt > c4b_sgpa.txt)
