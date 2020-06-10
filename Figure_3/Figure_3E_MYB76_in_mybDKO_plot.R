library(ggplot2)

MYB76_in_myb_DKO <- read.csv("MYB76_in_myb_DKO.csv")

MYB76_in_myb_DKO_plot <- ggplot(MYB76_in_myb_DKO, aes(x=Condition, y=AT5G07700)) + geom_bar(stat="identity") 

MYB76_in_myb_DKO_plot + scale_x_discrete(limits=c("WT_logCPM", "DKO_logFC")) + theme_bw()
