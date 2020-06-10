library(ggplot2)
library(tidyverse)
library(ggpubr)
library(rstatix)

TAA_R_data <-read.csv("TAA_R_data.csv")

TAA_assay_plot <- ggplot(TAA_R_data, aes(x=reorder(factor(Line), -Log_nat_value, FUN=median, desc =TRUE), y=Log_nat_value)) + geom_boxplot() + geom_jitter(shape=16, position=position_jitter(0.1)) + theme_bw() + stat_summary(fun.y="mean", geom="point", shape=23, size=3, fill="white") 

TAA_assay_plot + scale_x_discrete(limits=c("MYC3", "MYC4", "MYC2", "DREB2A", "DREB26", "DF1", "MYB73", "DHS"))

TAA_R_data %>%
  group_by(Line) %>%
  identify_outliers(Value)

# removed MYC3 measurement 5 as is extreme outlier and re-made TAA_assay_plot

TAA_R_data_minus_outlier <- read.csv("TAA_R_data_minus_outlier.csv")

TAA_R_data_minus_outlier_plot <- ggplot(TAA_R_data_minus_outlier, aes(x=reorder(factor(Line), -Log_nat_value, FUN=median, desc =TRUE), y=Log_nat_value)) + geom_boxplot() + geom_jitter(shape=16, position=position_jitter(0.1)) + theme_bw() + stat_summary(fun.y="mean", geom="point", shape=23, size=3, fill="white") 

TAA_R_data_minus_outlier_plot + scale_x_discrete(limits=c("MYC3", "MYC4", "MYC2", "DREB2A", "DREB26", "DF1", "MYB73", "DHS"))

# Compute Shapiro wilk test

data(TAA_R_data, package = "datarium")
TAA_R_data_minus_outlier %>%
  group_by(Line) %>%
  shapiro_test(Log_nat_value)

ggqqplot(TAA_R_data, x = "Log_nat_value", facet.by = "Line")

# Compute Levene test

TAA_R_data %>% levene_test(Log_nat_value ~ Line)

# Compute pairwise T-tests

pairwise.t.test(TAA_R_data$Log_nat_value, TAA_R_data$Line, paired=FALSE, pool.sd = TRUE, p.adjust.methods)

