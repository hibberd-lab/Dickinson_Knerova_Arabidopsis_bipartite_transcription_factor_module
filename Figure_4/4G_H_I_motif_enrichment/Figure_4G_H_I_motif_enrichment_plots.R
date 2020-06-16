library(ggplot2)

mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq <- read.csv("mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq.csv")

JASPAR_motifs_clusters <- read.csv("JASPAR_motifs_clusters.csv")

mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq_clusters <- merge(mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq, JASPAR_motifs_clusters[, c("id", "Cluster")], by="id")

ggplot(mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq, aes(x=reorder(factor(Cluster),-myc_down_myb_not_freq_norm, FUN=median, desc =TRUE),  y=myc_down_myb_not_freq_norm)) + geom_boxplot(fill="grey") + theme_bw() + geom_hline(yintercept = 1) + ylim(0,3.2)

ggplot(mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq, aes(x=reorder(factor(Cluster),-myb_down_myc_not_freq_norm, FUN=median, desc =TRUE),  y=myb_down_myc_not_freq_norm)) + geom_boxplot(fill="grey") + theme_bw() + geom_hline(yintercept = 1) + ylim(0,3.2)

ggplot(mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_motif_frequencies_total_freq, aes(x=reorder(factor(Cluster),-myc_myb_down_freq_norm, FUN=median, desc =TRUE),  y=myc_myb_down_freq_norm)) + geom_boxplot(fill="grey") + theme_bw() + geom_hline(yintercept = 1) + ylim(0,3.2)
