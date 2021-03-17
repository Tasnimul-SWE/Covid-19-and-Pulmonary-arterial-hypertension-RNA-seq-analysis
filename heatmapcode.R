library(gplots)
library(pheatmap)
c <-read.csv("heatmap.csv")
c <- c[order(c$PAH),]

row.names(c) <- c$X
c=c[,-1]

d <-data.matrix(c)


#yb <- colorRampPalette(c("white","red","white","blue"))
#heatmap.2(d, col=yb,main="    Upregulated genes", trace="none", margins= c(10,12), cexCol = 1,cexRow = 1)



pheatmap(d, border_color = "red", cellwidth = 20, fontsize_col = 14, fontsize_row = 10)
