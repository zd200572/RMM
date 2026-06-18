library(ggplot2)

#4mC-motif
mydata=read.table("4mC-motif-DGE-Methy.txt",header=T)
pdf("4mC-motif-DGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Genus, colour = Genus,shape = Sig, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "DGE and 4mC-Methy% for genes with Epi-Motif",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()
mydata=mydata[which(mydata$Sig == "sig"),]
pdf("4mC-motif-sigDGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Genus, colour = Genus, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "sig-DGE and 4mC-Methy% for genes with Epi-Motif",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()


#4mC-all
mydata=read.table("4mC-DGE-Methy.txt",header=T)
pdf("4mC-DGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum,shape = Sig, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "DGE and 4mC-Methy% for genes",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()
mydata=mydata[which(mydata$Sig == "sig"),]
pdf("4mC-sigDGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "sig-DGE and 4mC-Methy% for genes",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()



#5mC-motif
mydata=read.table("5mC-motif-DGE-Methy.txt",header=T)
pdf("5mC-motif-DGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum,shape = Sig, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "DGE and 5mC-Methy% for genes with Epi-Motif",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()
mydata=mydata[which(mydata$Sig == "sig"),]
pdf("5mC-motif-sigDGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "sig-DGE and 5mC-Methy% for genes with Epi-Motif",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()


#5mC-all
mydata=read.table("5mC-DGE-Methy.txt",header=T)
pdf("5mC-DGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum,shape = Sig, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "DGE and 5mC-Methy% for genes",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()
mydata=mydata[which(mydata$Sig == "sig"),]
pdf("5mC-sigDGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "sig-DGE and 5mC-Methy% for genes",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()


#6mA-motif
mydata=read.table("6mA-motif-DGE-Methy.txt",header=T)
pdf("6mA-motif-DGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum,shape = Sig, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "DGE and 6mA-Methy% for genes with Epi-Motif",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()
mydata=mydata[which(mydata$Sig == "sig"),]
pdf("6mA-motif-sigDGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "sig-DGE and 6mA-Methy% for genes with Epi-Motif",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()


#6mA-all
mydata=read.table("6mA-DGE-Methy.txt",header=T)
pdf("6mA-DGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum,shape = Sig, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "DGE and 6mA-Methy% for genes",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()
mydata=mydata[which(mydata$Sig == "sig"),]
pdf("6mA-sigDGE-Methy.pdf",width = 5,height =7)
ggplot(data = mydata,
       aes(x = RNALogFC, y = MethyRate*100,
           fill = Phylum, colour = Phylum, size = -log10(Pvalue))) +
  geom_point(alpha = 0.8, stroke = 1) +
  labs(
    title = "sig-DGE and 6mA-Methy% for genes",
    x = "LogFC(L/H)", y = "Methy-Rate %）"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 8, face = "bold"))
dev.off()


