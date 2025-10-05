
#!/bin/bash
#part1.sh 

# 1. Print your name
echo "Anne-Marie Sharp"

# 2. Create a folder titled your name & 3. Create biocomputing folder inside your name folder and change to it
mkdir -p Anne-Marie_Sharp/biocomputing && cd Anne-Marie_Sharp/biocomputing

# 4. Download the 3 files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

 
# 5. Move the .fna file to the folder titled your name
mv wildtype.fna ../

# 6. Delete the duplicate gbk file
rm -f wildtype.gbk.1

# 7. Confirm if the .fna file is mutant or wild type
if grep -q "tatatata" ../wildtype.fna; then
    echo "Mutant sequence"  

# 8. If mutant, print all matching lines into a new file
    grep "tatatata" ../wildtype.fna > ../mutant_lines.txt
else
    echo "Wild type sequence"
fi


# 9 Count number of lines (excluding header) in the .gbk file
head wildtype.gbk  # View the file first
tail -n +2 wildtype.gbk | wc -l # Count lines

# 10. Print the sequence length of the .gbk file (LOCUS tag, first line)
grep "LOCUS" wildtype.gbk | awk '{print $3}'

# 11. Print the source organism of the .gbk file (SOURCE tag)
grep "SOURCE" wildtype.gbk

# 12. List all the gene names of the .gbk file
grep "/gene=" wildtype.gbk

# 13. Clear terminal and print all commands used 
clear
history

# 14. List the files in the two folders
ls ../           # Anne-Marie_Sharp folder contents
ls .             # biocomputing folder contents
