library(ggplot2)
library(tidyverse)
library(ggpubr)
library(rstatix)

dreb2a_myc234_wt_MYB76_vs_APA1_Rdata <- read.csv("dreb2a_myc234_wt_MYB76_vs_APA1_Rdata.csv")

dreb2a_myc234_wt_MYB76_vs_APA1_plot <- ggplot(dreb2a_myc234_wt_MYB76_vs_APA1_Rdata, aes(x=factor(Genotype), y=vs.APA1)) + geom_boxplot(width=.4) + stat_summary(fun.y="mean", geom="point", shape=23, size=3, fill="white")

dreb2a_myc234_wt_MYB76_vs_APA1_plot + scale_x_discrete(limits=c("WT","dreb2a","myc234")) + geom_jitter(shape = 16, position = position_jitter(width = 0.05)) + theme_bw()

# Compute Shapiro wilk test

data(dreb2a_myc234_wt_MYB76_vs_APA1_Rdata, package = "datarium")
dreb2a_myc234_wt_MYB76_vs_APA1_Rdata %>%
  group_by(Genotype) %>%
  shapiro_test(vs.APA1)

ggqqplot(dreb2a_myc234_wt_MYB76_vs_APA1_Rdata, x = "vs.APA1", facet.by = "Genotype")

# Compute Levene test

dreb2a_myc234_wt_MYB76_vs_APA1_Rdata %>% levene_test(vs.APA1 ~ Genotype)

# Compute pairwise T-tests

pairwise.t.test(dreb2a_myc234_wt_MYB76_vs_APA1_Rdata$vs.APA1, dreb2a_myc234_wt_MYB76_vs_APA1_Rdata$Genotype, paired=FALSE, pool.sd = FALSE, p.adjust.methods)
