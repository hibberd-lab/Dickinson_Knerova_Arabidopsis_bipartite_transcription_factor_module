mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_fimo <- read.csv("mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_fimo.csv")

JASPAR_motifs_clusters <- read.csv("JASPAR_motifs_clusters.csv")

mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_fimo_clusters <- merge(mycT_mybDKO_under_minus_0_75_list_p1500_JASPAR_fimo, JASPAR_motifs_clusters[, c("id", "Cluster")], by="id")

# Sort this output file to only include matches to cluster 8 and 18 motifs. 

# Add a new column for motif centre. Centre = start + ((end-start)/2).

# Make a new text file for spacing input with columns: 'sequence_name', 'Centre', 'Cluster'. Sorted by sequence name and Centre. 