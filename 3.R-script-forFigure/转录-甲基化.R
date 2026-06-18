# 加载必要的库
library(ggplot2)
library(ggrepel)
library(dplyr)

# 1. 读取数据
data <- read.table("tgs.L7252-2.vamb.2-corr.txt", header = TRUE, sep = "\t")

# 2. 参数设置与数据预处理
gap <- 0.3  # 设置双分界线之间的半间距

data_plot <- data %>%
  mutate(
    # 计算绘图时的 y 轴起点和终点
    # 上方轨道从 +gap 开始向上生长，下方从 -gap 开始向下生长
    y_start = ifelse(track == "upper", gap, -gap),
    y_end = ifelse(track == "upper", y + gap, -y - gap),
    
    # 核心颜色逻辑：
    # 上方轨道且 nosig 设为灰色；其余（所有 lower 和 upper sig）按 type 上色
    color_group = case_when(
      track == "upper" & sig == "nosig" ~ "nosig",
      TRUE ~ as.character(type)
    ),
shape_logic = ifelse(y >= 0, "up_shape", "down_shape")
)

# 准备自定义 X 轴刻度数据框（定位在下方分界线处）
x_breaks_values <- seq(min(data_plot$pos), max(data_plot$pos), length.out = 5)
axis_df <- data.frame(
  x = x_breaks_values,
  label = paste0(round(x_breaks_values / 1e6, 2), " Mb")
)

# 3. 绘图
p <- ggplot() +
  # A. 绘制“双杠”分界线
  geom_hline(yintercept = c(gap, -gap), color = "black", size = 0.8) +
  
  # B. 绘制棒棒糖的“杆” (geom_segment 使用预设的起点和终点)
  geom_segment(data = data_plot, 
               aes(x = pos, xend = pos, y = y_start, yend = y_end, color = color_group), 
               size = 0.6) +
  
  # C. 绘制棒棒糖的“头”
  geom_point(data = data_plot, 
             aes(x = pos, y = y_end, color = color_group, shape = type), 
             size = 5, alpha = 0.8) +
  
  # D. 添加基因标签 (仅针对 upper 轨道的 sig 位点)
  geom_text_repel(data = filter(data_plot, track == "upper" & sig == "sig"), 
                  aes(x = pos, y = y_end, label = gene),
                  size = 3.2, fontface = "italic",
                  nudge_y = 1.2, segment.color = 'grey50', direction = "y") +
  
  # E. 在“下杠” (-gap) 位置绘制坐标和刻度线
  # 刻度标签放在下杠的稍微下方
  geom_text(data = axis_df, aes(x = x, y = -gap - 0.5, label = label), 
            size = 3.5, color = "black", fontface = "bold", vjust = 1) +
  # 刻度短线穿过下杠
  geom_segment(data = axis_df, aes(x = x, xend = x, y = -gap - 0.2, yend = -gap + 0.2), 
               color = "black", size = 0.7) +
  
  # 4. 颜色与形状方案设置
  scale_color_manual(values = c(
    "up" = "#229ca9",      # 红色
    "down" = "#fa4659",    # 蓝色
    "6mA" = "#86b7db",     # 橙色
    "5mC" = "#e77c8e",     # 紫色
    "nosig" = "#D3D3D3"    # 浅灰色 (仅用于 upper 轨道)
  )) +
  #fa4659
  scale_shape_manual(values = c(
    "up" = 16,    # 实心圆
    "down" = 17,  # 实心三角形
    "6mA" = 16,   
    "5mC" = 16
  )) +
  scale_y_continuous(
    breaks = c(-1.3, -0.8, -gap, gap, 0.8, 1.3),
    labels = c("10", "05", "Methy", "Expr", "5.0", "10.0")
  ) +
  
  # 5. 主题与细节调整
  theme_minimal() +
  theme(
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.line.x = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.title.y = element_text(size = 11, face = "bold"),
    legend.position = "right",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold")
  ) +
  labs(title = "Co-localization of DEGs and Methylation Sites",
       y = "Genomic Features Intensity",
       color = "Group",
       shape = "Type")

# 6. 打印显示
print(p)