library(ggplot2)

mycT_vs_mybDKO <- read.csv("mycT_vs_mybDKO.csv")

ggplot(mycT_vs_mybDKO, aes(x=mycT, y=mybDKO, colour=mycT_mybDKO_down)) + scale_colour_manual(values=c("black", "red")) + geom_point() + theme_bw() + xlim(-10, 10) + ylim(-10, 10)

ggplot(mycT_vs_mybDKO, aes(x=mycT, y=mybDKO, colour=mycT_down)) + scale_colour_manual(values=c("black", "red")) + geom_point() + theme_bw() + xlim(-10, 10) + ylim(-10, 10)

ggplot(mycT_vs_mybDKO, aes(x=mycT, y=mybDKO, colour=mybDKO_down)) + scale_colour_manual(values=c("black", "red")) + geom_point() + theme_bw() + xlim(-10, 10) + ylim(-10, 10)
