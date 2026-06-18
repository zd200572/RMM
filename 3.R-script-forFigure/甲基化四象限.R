library(ggplot2)
library(ggrepel)

# 1. 读取数据
df <- read.csv("~/Desktop/6ma.csv")

# 2. 过滤数据
df_filtered <- subset(df, Pvalue <= 0.05)

# 3. 设置显著性阈值
logfc_cutoff <- 5      
methy_cutoff <- 90     

# 4. 绘图
p <- ggplot(df_filtered, aes(x = LogFC, y = Methy_Rate, color = Phylum)) +
  
  # --- 修改部分：使用 annotate 替代 geom_rect 以消除警告 ---
  # 左上角阴影区
  annotate("rect", xmin = -Inf, xmax = -logfc_cutoff, ymin = methy_cutoff, ymax = Inf,
           fill = "lightblue", alpha = 0.2) + # alpha 建议稍微调高一点点，否则看不见
  # 右上角阴影区
  annotate("rect", xmin = logfc_cutoff, xmax = Inf, ymin = methy_cutoff, ymax = Inf,
           fill = "pink", alpha = 0.2) +
  
  # 绘制气泡
  geom_point(size = 2, alpha = 0.6) +  
  
  # 添加象限分割线
  geom_vline(xintercept = 0, linetype = "dashed", color = "grey50") +
  geom_vline(xintercept = c(-logfc_cutoff, logfc_cutoff), linetype = "solid", color = "black") +
  geom_hline(yintercept = methy_cutoff, linetype = "solid", color = "black") +
  
  # 美化坐标轴和主题
  theme_bw() +
  scale_color_brewer(palette = "Set1") + 
  labs(
    title = "Quadrant Analysis: Methylation vs. Gene Expression (P <= 0.05)",
    x = "Log2 Fold Change (Low/High)",
    y = "5mC Methylation Rate (%)",
    color = "Phylum"
  ) +
  theme(
    panel.grid.minor = element_blank(),
    legend.position = "right"
  )

# 5. 显示
print(p)

