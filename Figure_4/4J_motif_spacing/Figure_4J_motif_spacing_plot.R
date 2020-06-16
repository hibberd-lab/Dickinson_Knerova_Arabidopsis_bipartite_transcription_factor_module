At_random2000_1_distance_cl8_18_no_not_both <- read.csv("At_random200_1_distance_cl8_18_no_not_both.csv")

Random66_1 <- sample_n(At_random2000_1_distance_cl8_18_no_not_both, 66)

Random66_2 <- sample_n(At_random2000_1_distance_cl8_18_no_not_both, 66)

Random66_3 <- sample_n(At_random2000_1_distance_cl8_18_no_not_both, 66)

Random66_4 <- sample_n(At_random2000_1_distance_cl8_18_no_not_both, 66)

four_random66_sets <- rbind.data.frame(Random66_1, Random66_2, Random66_3, Random66_4)

# combined four_random66_sets with myc_myb sets distance outputs

myc_myb_mutants_random_sets_spacing_plot <- ggplot(myc_myb_mutants_random_sets_spacing, aes(x=reorder(factor(Set), log_distance_plus_one, FUN=median), y=log_distance_plus_one)) + geom_violin(fill="grey") + theme_bw()

myc_myb_mutants_random_sets_spacing_plot + geom_jitter(shape=16, size=0.25, position=position_jitter(0.1)) + stat_summary(fun = median, geom = "crossbar", width = 0.4, size=0.25) + stat_summary(fun="mean", geom="point", shape=23, size=3, fill="white") 

# Compute Shapiro wilk test

data(myc_myb_mutants_random_sets_spacing_plot, package = "datarium")
myc_myb_mutants_random_sets_spacing_plot %>%
  group_by(Set) %>%
  shapiro_test(log_distance_plus_one)

ggqqplot(myc_myb_mutants_random_sets_spacing_plot, x = "log_distance_plus_one", facet.by = "Set")

# Run pairwise Wilcoxon rank sum test

pairwise.wilcox.test(myc_myb_mutants_random_sets_spacing_plot$log_distance_plus_one, myc_myb_mutants_random_sets_spacing_plot$Set, p.adjust.method = p.adjust.methods,
                     paired = FALSE)
