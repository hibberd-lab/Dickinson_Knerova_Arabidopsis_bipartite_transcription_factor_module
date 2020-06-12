library(ggplot2)

mycT_vs_mybDKO <- read.csv("mycT_vs_mybDKO.csv")

mycT_mybDKO_down_plot <- ggplot(mycT_vs_mybDKO, aes(x=mycT, y=mybDKO, colour=(mycT_mybDKO_down))) + scale_colour_manual(values=c("black", "red")) + geom_point() + theme_bw() + xlim(-10, 10) + ylim(-10, 10) + theme(legend.position="none")

mycT_mybDKO_down_plot + theme(axis.text.x = element_text(size=rel(2), colour="black")) + theme(axis.text.y = element_text(size=rel(2), colour="black")) + theme(axis.title.y=element_blank()) + theme(axis.title.x=element_blank())

mycT_down_down_plot <- ggplot(mycT_vs_mybDKO, aes(x=mycT, y=mybDKO, colour=mycT_down)) + scale_colour_manual(values=c("black", "red")) + geom_point() + theme_bw() + xlim(-10, 10) + ylim(-10, 10) + theme(legend.position="none")

mycT_down_down_plot + theme(axis.text.x = element_text(size=rel(2), colour="black")) + theme(axis.text.y = element_text(size=rel(2), colour="black")) + theme(axis.title.y=element_blank()) + theme(axis.title.x=element_blank())

mybDKO_down_down_plot <- ggplot(mycT_vs_mybDKO, aes(x=mycT, y=mybDKO, colour=mybDKO_down)) + scale_colour_manual(values=c("black", "red")) + geom_point() + theme_bw() + xlim(-10, 10) + ylim(-10, 10) + theme(legend.position="none")

mybDKO_down_down_plot + theme(axis.text.x = element_text(size=rel(2), colour="black")) + theme(axis.text.y = element_text(size=rel(2), colour="black")) + theme(axis.title.y=element_blank()) + theme(axis.title.x=element_blank())
