library(ggplot2)

At_GLS_expression <- read.csv("At_GLS_expression.csv")

ggplot(At_GLS_expression, aes(x = reorder(id, -log2), y=log2)) + geom_bar(stat="identity" , fill="lightblue", colour="black") + theme_bw() + theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
