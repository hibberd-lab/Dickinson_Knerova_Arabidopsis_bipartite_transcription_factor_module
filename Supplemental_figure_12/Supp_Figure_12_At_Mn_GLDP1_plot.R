library(ggplot2)

M_nitens_At_GLDP1pro <- read.csv("M_nitens_At_GLDP1pro.csv")

JASPAR_motifs_clusters <- read.csv("JASPAR_motifs_clusters.csv")

M_nitens_At_GLDP1pro_clusters <- merge(M_nitens_At_GLDP1pro, JASPAR_motifs_clusters[, c("id", "Cluster")], by="id")

write.csv(M_nitens_At_GLDP1pro_clusters, file="M_nitens_At_GLDP1pro_clusters.csv")

# sort FIMO output to only keep matches to clusters 8 and 18.

M_nitens_At_GLDP1pro_clusters_8_18 <- read.csv("M_nitens_At_GLDP1pro_clusters_8_18.csv")

ggplot(M_nitens_At_GLDP1pro_clusters_8_18, aes(x=start, y=p_value, colour=Cluster)) + geom_point(size=0.5) + facet_wrap( ~ sequence_name) + theme_bw()
