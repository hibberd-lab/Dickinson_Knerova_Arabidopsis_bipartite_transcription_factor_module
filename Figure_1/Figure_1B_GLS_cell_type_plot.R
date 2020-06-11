library(ggplot2)

At_GLS_expression <- read.csv("At_GLS_expression.csv")

ggplot(At_GLS_expression, aes(x = reorder(Name, -log2_BS_M), y=log2_BS_M, fill=Group)) + geom_bar(stat="identity", colour="black") + theme_bw() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) + scale_fill_manual(values=c("#abd7e6ff", "#ffc800ff", "#ff6400ff"))
