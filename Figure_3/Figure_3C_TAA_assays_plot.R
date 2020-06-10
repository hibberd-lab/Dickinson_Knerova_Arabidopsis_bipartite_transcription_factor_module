library(ggplot2)

TAA_R_data <-read.csv("TAA_R_data.csv")

TAA_assay_plot <- ggplot(TAA_R_data, aes(x=reorder(factor(Line), -Log_nat_value, FUN=median, desc =TRUE), y=Log_nat_value)) + geom_boxplot() + geom_jitter(shape=16, position=position_jitter(0.1)) + theme_bw() + stat_summary(fun.y="mean", geom="point", shape=23, size=3, fill="white") 

TAA_assay_plot + scale_x_discrete(limits=c("MYC3", "MYC4", "MYC2", "DREB2A", "DREB26", "DF1", "MYB73", "DHS"))
