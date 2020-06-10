# myc2/3/4 only down cell-type expression plot

mycT_down_mybDKO_not_At_celltype <- read.csv("mycT_down_mybDKO_not_At_celltype.csv")

mycT_down_mybDKO_not_At_celltype_plot <- ggplot(mycT_down_mybDKO_not_At_celltype, aes(x=log2_BS_35S)) + geom_density(fill="grey") + xlim(-4, 4)

mycT_down_mybDKO_not_At_celltype_plot + theme_bw() + geom_vline(xintercept = 0) + geom_vline(aes(xintercept=median(log2_BS_35S)), linetype="dashed")

# myb28/29 only down cell-type expression plot

mybDKO_down_mycT_not_At_celltype <- read.csv("mybDKO_down_mycT_not_At_celltype.csv")

mybDKO_down_mycT_not_At_celltype_plot <- ggplot(mybDKO_down_mycT_not_At_celltype, aes(x=log2_BS_35S)) + geom_density(fill="grey") + xlim(-4, 4)

mybDKO_down_mycT_not_At_celltype_plot + theme_bw() + geom_vline(xintercept = 0) + geom_vline(aes(xintercept=median(log2_BS_35S)), linetype="dashed")

# myc2/3/4 and myb28/29 down cell-type expression plot

mycT_mybDKO_under_minus_0_75_list_At_cell_type <- read.csv("mycT_mybDKO_under_minus_0_75_list_At_cell_type.csv")

mycT_mybDKO_under_minus_0_75_list_At_cell_type_plot <- ggplot(mycT_mybDKO_under_minus_0_75_list_At_cell_type, aes(x=log2_BS_35S)) + geom_density(fill="grey") + xlim(-4, 4)

mycT_mybDKO_under_minus_0_75_list_At_cell_type_plot + theme_bw() + geom_vline(xintercept = 0) + geom_vline(aes(xintercept=median(log2_BS_35S)), linetype="dashed")

