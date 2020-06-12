gene_list=mycT_mybDKO_under_minus_0_75_list
gff=/Users/patrickdickinson/Documents/Abundance_motif_stuff/Datasets/Athaliana_167_TAIR10.all_features.gff
genome_fa=/Users/patrickdickinson/Documents/Abundance_motif_stuff/Datasets/Athaliana_167_TAIR9.fa
name=mycT_mybDKO_under_minus_0_75_test
DAPseq=JASPAR.meme
UTR_BODY=N
promoter_size=1500


awk '($3=="mRNA") {print}' ${gff} > ${gff}_tmp; awk '{ sub("\r$", ""); print }' ${gene_list} | awk -v "gff=${gff}_tmp" '{cmd="grep "$1" "gff; print cmd; system(cmd)}' | awk -v "ps=${promoter_size}" '{OFS="\t"; split($9, a, "."); split(a[1], b, "=")} ($7=="+") {print $1, $4-ps, $4, b[2], ".", $7} ($7=="-") {print $1, $5, $5+ps, b[2], ".", $7}' | awk '($2>0 && $3>$2) {print}' | bedtools getfasta -s -name -fi ${genome_fa} -bed stdin -fo ${name}.fa;

####### now we want to run fimo (in parallel) searching the DAPseq motifs against these promoters #######

fasta-get-markov -m 1 ${name}.fa ${name}.bg

fimo -o ${f}_fimo --verbosity 1 --bgfile ${name}.bg ${DAPseq} ${name}.fa

###### now we want to process the fimo output to get our hands on the motif frequencies. first part prevents double counting ######

awk '{OFS="\t"; print $1, $3}' ./${name}_fimo/fimo.tsv | sort -k1,1 -k2,2 | uniq | cut -f1 | sort | uniq -c | awk '!/#/ {total+=$1; OFS="\t"; print $2, $1} END {print "total", total}' > ${name}_motif_frequencies_gene_freq
awk '{OFS="\t"; print $1, $3, $10}' ./${name}_fimo/fimo.tsv | sort -k1,1 -k2,2 -k3,3 | uniq | cut -f1 | sort | uniq -c | awk '!/#/ {total+=$1; OFS="\t"; print $2, $1} END {print "total", total}' > ${name}_motif_frequencies_total_freq
awk '{OFS="\t"; print $1, $3, $10}' ./${name}_fimo/fimo.tsv | sort -k1,1 -k2,2 -k3,3 | uniq | cut -f1,2 | uniq -c | awk '{OFS="\t"; print $2, $3, $1}' > ${name}_motif_freq_per_gene.txt

echo "see motif frequencies output and copy into excel etc for further analysis"
