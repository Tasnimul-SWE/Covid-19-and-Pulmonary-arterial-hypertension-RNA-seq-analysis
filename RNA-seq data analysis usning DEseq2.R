library(DESeq2)
library(DESeq)
library(dplyr)

data<-read.csv("GSE147507_RawReadCounts_Human.csv",header=T, sep=',')

metaData <- read.csv('GSE147507_filtered_metadata.csv', header = T, sep=',')

#cnts<-as.matrix(data)

dds <- DESeqDataSetFromMatrix(countData=data, 
                              colData=DataFrame(metaData), 
                              design=~treatment, tidy=T)
dds

dds <- DESeq(dds)
res <- results(dds)

write.csv(res, file = "RNA-seq_results.csv")

new_data_RNA_seq<- read.csv("RNA-seq_results.csv",header=T, sep=',')

new_data_RNA_seq

is.na(new_data_RNA_seq)
omit_na <- na.omit(new_data_RNA_seq)

omit_na_filter<- filter(omit_na, log2FoldChange>1 & log2FoldChange<1.139  & padj<0.05)

write.csv(omit_na_filter, file="filter.csv")







