library(ggplot2)
library(gggenes)

#pdf("tgs.All.vamb.58-gene.pdf",width=8,height=5)
mydata <- read.table("tgs.L7252-2.vamb.2-gene.txt", header = TRUE, sep = "\t")
ggplot(mydata, aes(xmin = start, xmax = end, y = molecule, fill = keysgene,forward =orientation,label = gene)) +
  geom_gene_arrow() +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  scale_fill_brewer(palette = "Set3") +
  geom_gene_label(align = "centre")+
  theme_genes()+
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12, face = "bold"),
    legend.position = "right",
    legend.key.size = unit(0.8, "cm"),
    legend.title = element_text(size = 10, face = "bold"),
    legend.text = element_text(size = 9)
  )
#dev.off()
