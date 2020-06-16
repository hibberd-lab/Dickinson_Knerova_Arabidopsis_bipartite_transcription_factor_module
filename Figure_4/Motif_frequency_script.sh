if (!require(package)) install.packages('package')
library(package)

gene_list=
gff=Athaliana_167_TAIR10.all_features.gff
genome_fa=Athaliana_167_TAIR9.fa
name=
DAPseq=JASPAR.meme
UTR_BODY=N
promoter_size=1500

awk '($3=="mRNA") {print}' ${gff} > ${gff}_tmp; awk '{ sub("\r$", ""); print }' ${gene_list} | awk -v "gff=${gff}_tmp" '{cmd="grep "$1" "gff; print cmd; system(cmd)}' | awk -v "ps=${promoter_size}" '{OFS="\t"; split($9, a, "."); split(a[1], b, "=")} ($7=="+") {print $1, $4-ps, $4, b[2], ".", $7} ($7=="-") {print $1, $5, $5+ps, b[2], ".", $7}' | awk '($2>0 && $3>$2) {print}' | bedtools getfasta -s -name -fi ${genome_fa} -bed stdin -fo ${name}.fa;

fasta-get-markov -m 1 ${name}.fa ${name}.bg

fimo -o ${f}_fimo --verbosity 1 --bgfile ${name}.bg ${DAPseq} ${name}.fa

awk '{OFS="\t"; print $1, $3, $10}' ./${name}_fimo/fimo.tsv | sort -k1,1 -k2,2 -k3,3 | uniq | cut -f1 | sort | uniq -c | awk '!/#/ {total+=$1; OFS="\t"; print $2, $1} END {print "total", total}' > ${name}_motif_frequencies_total_freq

echo "see motif frequencies output and copy into excel etc for further analysis"
