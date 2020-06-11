library(ggplot2)

AtBS_top200_GO_top20 <- read.csv("AtBS_top200_GO_top20.csv")

ggplot(AtBS_top200_GO_top20, aes(x = reorder(Term, Fold_enrichment), y=Fold_enrichment)) + geom_bar(stat="identity" , fill="grey", colour="black") + theme_bw() + coord_flip()

# glycosinolate biosynthetic glycosinolate metabolic process and glycosinolate biosynthetic process removed from GO terms as look like duplicates of glucosinolate metabolic process and glucosinolate biosynthetic process
