library(ggplot2)
library(gridExtra)

mydata=read.table("4mC-motif-MethyBody.txt",header=T,sep="\t")
# 2. 绘制密度图：优化geom_density参数（关键优化3）
p1=ggplot(data = mydata,
       aes(x = MethySite*100, fill = Phylum)) +
  # 核心修复：指定density的参数，避免算法警告
  geom_density(
    color = NA,
    size = 0.8,
    alpha = 0.5,
    adjust = 1.2, # 调整平滑度，减少边界警告
    trim = TRUE,  # 仅在数据范围内绘制密度曲线（核心！解决边界警告）
    na.rm = TRUE  # 忽略NA值（若有）
  ) +
  labs(
    title = "4mC Motif Methy-Site within gene body",
    x = "MethySite within each Gene",
    y = "Density"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    legend.key.size = unit(1, "cm")
  )

mydata=read.table("5mC-motif-MethyBody.txt",header=T,sep="\t")
# 2. 绘制密度图：优化geom_density参数（关键优化3）
p2=ggplot(data = mydata,
          aes(x = MethySite*100, fill = Phylum)) +
  # 核心修复：指定density的参数，避免算法警告
  geom_density(
    color = NA,
    size = 0.8,
    alpha = 0.5,
    adjust = 1.2, # 调整平滑度，减少边界警告
    trim = TRUE,  # 仅在数据范围内绘制密度曲线（核心！解决边界警告）
    na.rm = TRUE  # 忽略NA值（若有）
  ) +
  labs(
    title = "5mC Motif Methy-Site within gene body",
    x = "MethySite within each Gene",
    y = "Density"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    legend.key.size = unit(1, "cm")
  )

mydata=read.table("6mA-motif-MethyBody.txt",header=T,sep="\t")
# 2. 绘制密度图：优化geom_density参数（关键优化3）
p3=ggplot(data = mydata,
          aes(x = MethySite*100, fill = Phylum)) +
  # 核心修复：指定density的参数，避免算法警告
  geom_density(
    color = NA,
    size = 0.8,
    alpha = 0.5,
    adjust = 1.2, # 调整平滑度，减少边界警告
    trim = TRUE,  # 仅在数据范围内绘制密度曲线（核心！解决边界警告）
    na.rm = TRUE  # 忽略NA值（若有）
  ) +
  labs(
    title = "6mA Motif Methy-Site within gene body",
    x = "MethySite within each Gene",
    y = "Density"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    legend.key.size = unit(1, "cm")
  )

pdf("MethyBody.pdf",width=12,height=10)
grid.arrange(p1,p2,p3,ncol=1,nrow=3)
dev.off()



