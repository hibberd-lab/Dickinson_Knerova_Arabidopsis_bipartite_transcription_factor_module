library(ggplot)

MYB76_DHS_fimo_JASPAR <- read.csv("MYB76_DHS_fimo_JASPAR.csv")

MYB76_DHS_fimo_JASPAR_clusters <- merge(MYB76_DHS_fimo_JASPAR, JASPAR_motifs_clustered[, c("JASPAR_id", "Cluster")], by="JASPAR_id")

ggplot(MYB76_DHS_fimo_JASPAR_clusters, aes(x=centre, y=p_value, colour=factor(Cluster))) + geom_point(size=1) + theme_bw() + theme(legend.position="bottom")
