library(ggplot2)

mydata=read.table("input1.txt",header=T,sep="\t")
pdf("M-R-genes.pdf",width = 6,height =3)
ggplot(data = mydata,
       aes(x = Type,  # 横坐标：地区
           y = Num,   # 纵坐标：销售额
           fill = Enzyme)) +  # 核心：填充色映射二分类变量（产品类型）
  # 绘制分组并列柱状图（position = "dodge" 为默认，可省略）
  geom_col(position = "dodge",  # 分组并列，不重叠
           width = 0.7,         # 柱子宽度
           colour = "black",    # 柱子边框色（统一黑色，更整洁）
           stroke = 0.5) +      # 边框宽度
  # 核心：手动指定两种颜色，对应二分类变量
  # 图表标签与主题
  labs(
    title = "No. of Multiple types of Methyltransferase / Restriction enzymes",
    x = "",
    y = "Gene No."
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    legend.position = "right"  # 图例放在顶部，节省空间
  )
dev.off()

