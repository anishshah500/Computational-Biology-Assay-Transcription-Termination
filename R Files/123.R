 getwd()
setwd("/Volumes/data/nm/anishns/nascentdata/")
data.5m.1 <- read.delim("graph_data_5m_1.gtf.txt",sep="\t")
data.5m.2 <- read.delim("graph_data_5m_2.gtf.txt",sep="\t")
data.5m.3 <- read.delim("graph_data_5m_3.gtf.txt",sep="\t")
data.10m.1 <- read.delim("graph_data_10m_1.gtf.txt",sep="\t")
data.10m.2 <- read.delim("graph_data_10m_2.gtf.txt",sep="\t")
data.10m.3 <- read.delim("graph_data_10m_3.gtf.txt",sep="\t")
data.20m.1 <- read.delim("graph_data_20m_1.gtf.txt",sep="\t")
data.20m.2 <- read.delim("graph_data_20m_2.gtf.txt",sep="\t")
data.20m.3 <- read.delim("graph_data_20m_3.gtf.txt",sep="\t")
data.TOTAL.1 <- read.delim("graph_data_TOTAL_1.gtf.txt",sep="\t")
data.TOTAL.2 <- read.delim("graph_data_TOTAL_2.gtf.txt",sep="\t")

# removing last column of NAs
data.5m.1 <- data.5m.1[,-ncol(data.5m.1)]
data.5m.2 <- data.5m.2[,-ncol(data.5m.2)]
data.5m.3 <- data.5m.3[,-ncol(data.5m.3)]
data.10m.1 <- data.10m.1[,-ncol(data.10m.1)]
data.10m.2 <- data.10m.2[,-ncol(data.10m.2)]
data.10m.3 <- data.10m.3[,-ncol(data.10m.3)]
data.20m.1 <- data.20m.1[,-ncol(data.20m.1)]
data.20m.2 <- data.20m.2[,-ncol(data.20m.2)]
data.20m.3 <- data.20m.3[,-ncol(data.20m.3)]
data.TOTAL.1 <- data.TOTAL.1[,-ncol(data.TOTAL.1)]
data.TOTAL.2 <- data.TOTAL.2[,-ncol(data.TOTAL.2)]
length(data.TOTAL.2)

# normalizing by coverage information
data.5m.1.norm <- t(apply(data.5m.1[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.5m.2.norm <- t(apply(data.5m.2[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.5m.3.norm <- t(apply(data.5m.3[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.10m.1.norm <- t(apply(data.10m.1[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.10m.2.norm <- t(apply(data.10m.2[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.10m.3.norm <- t(apply(data.10m.3[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.20m.1.norm <- t(apply(data.20m.1[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.20m.2.norm <- t(apply(data.20m.2[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.20m.3.norm <- t(apply(data.20m.3[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.TOTAL.1.norm <- t(apply(data.TOTAL.1[,-1], 1, function(x){ return(x[-1]/x[1]) }))
data.TOTAL.2.norm <- t(apply(data.TOTAL.2[,-1], 1, function(x){ return(x[-1]/x[1]) }))
length(avg.data.TOTAL.2)

avg.data.5m.1 <- (colMeans(data.5m.1.norm, na.rm=T))/54594018 / 1e6
avg.data.5m.2 <- (colMeans(data.5m.2.norm, na.rm=T))/55556792/ 1e6
avg.data.5m.3 <- (colMeans(data.5m.3.norm, na.rm=T))/76064850/ 1e6
avg.data.10m.1 <- (colMeans(data.10m.1.norm, na.rm=T))/64813340/ 1e6
avg.data.10m.2 <- (colMeans(data.10m.2.norm, na.rm=T))/61476086/ 1e6
avg.data.10m.3 <- (colMeans(data.10m.3.norm, na.rm=T))/58925778/ 1e6
avg.data.20m.1 <- (colMeans(data.20m.1.norm, na.rm=T))/62670432/ 1e6
avg.data.20m.2 <- (colMeans(data.20m.2.norm, na.rm=T))/54059038/ 1e6
avg.data.20m.3 <- (colMeans(data.20m.3.norm, na.rm=T))/65104716/ 1e6
avg.data.TOTAL.1 <- (colMeans(data.TOTAL.1.norm, na.rm=T))/124495466/ 1e6
avg.data.TOTAL.2 <- (colMeans(data.TOTAL.2.norm, na.rm=T))/110665702/ 1e6


avg.data.table <- data.frame(time = c(rep("5m", length(avg.data.5m.1)*3),
                                      rep("10m", length(avg.data.10m.1)*3),
                                      rep("20m", length(avg.data.20m.1)*3),
                                      rep("TOTAL", length(avg.data.TOTAL.1)*2)),
                             rep = c(rep(c("rep1","rep2","rep3"), each=length(avg.data.5m.1)),
                                     rep(c("rep1","rep2","rep3"), each=length(avg.data.10m.1)),
                                     rep(c("rep1","rep2","rep3"), each=length(avg.data.20m.1)),
                                     rep(c("rep1","rep2"),each=length(avg.data.TOTAL.1))),
                             position=rep(c(-1000:999),11),
                             cov = c(avg.data.5m.1, avg.data.5m.2, avg.data.5m.3, avg.data.10m.1, avg.data.10m.2, avg.data.10m.3, avg.data.20m.1, avg.data.20m.2, avg.data.20m.3, avg.data.TOTAL.1, avg.data.TOTAL.2))
avg.data.table$time <- factor(avg.data.table$time, levels=c("5m","10m","20m","TOTAL"))

pdf("metagene_total.gtf.pdf", width=5, height=10)
ggplot(avg.data.table, aes(x=position, y=cov, color=factor(time), alpha=factor(rep))) + geom_line(alpha=0.5) + 
 labs(x="position",y="coverage",color="timepoint") + theme_bw() 
dev.off()

#positions <- grep("^X",names(data),value = "TRUE")
#positions <- positions[2:2003]
#subdata <- data[data$Region.Name == "gene_id:FBgn0035181;single_0",positions]
#as.numeric(as.character(subdata$positions))
#subdata <- subdata[data$Region.Name,substring(data$positions,first = 1,last = 5)]


pdf("genes_gtf_test.pdf")
#i = 1
for(i in c(1:10)){
  name = as.character(data.5m.1[i,1])
  gene.data.table <- data.frame(time = c(rep("5m", 2000*2),
                                        rep("10m", 2000)),
                               rep = c(rep(c("rep1","rep2"), each=2000),
                                       rep("rep1",2000)),
                               position=rep(c(-1000:999),3),
                               cov = c(data.5m.1.norm[i,], data.5m.2.norm[i,], data.10m.1.norm[i,]))
  gene.data.table$time <- factor(gene.data.table$time, levels=c("5m","10m"))
  print(ggplot(gene.data.table, aes(x=position, y=cov, color=factor(time), alpha=factor(rep))) + geom_line(alpha=1) + 
    labs(x="position",y="coverage",color="timepoint",title=name) + theme_bw())
}
dev.off()


plot <- data.frame(Value = unlist(subdata),Position = k)
positions <- substring(plot$Position,first = 1,last = 5)
plot(Value ~ Position,plot) 

plot
ggplot(plot,aes(x = Position,y = Value)) + geom_line(color = "black ")
positions

subdata
str(positions)
str(subdata)
subdata[1]
rownames(subdata)
k <- as.numeric(substring(colnames(subdata),first = 2,last = 5))
colnames(plot)

#Intersecting gene IDs
length(region) <- intersect(data.5m.1$Region.Name, data.5m.2$Region.Name)
region <- intersect(data.5m.3$Region.Name,region) 
region <- intersect(region,data.10m.1$Region.Name) 
region <- intersect(region,data.10m.2$Region.Name) 
region <- intersect(region,data.10m.3$Region.Name)
region <- intersect(region,data.20m.1$Region.Name)
region <- intersect(region,data.20m.2$Region.Name) 
region <- intersect(region,data.20m.3$Region.Name) 
region <- intersect(region,data.TOTAL.1$Region.Name)
region <- intersect(region,data.TOTAL.2$Region.Name)
region

#intersecting genes
data.5m.1 <- data.5m.1[data.5m.1$Region.Name %in% region,]
data.5m.2 <- data.5m.2[data.5m.2$Region.Name %in% region,]
data.5m.3 <- data.5m.3[data.5m.3$Region.Name %in% region,]
data.10m.1 <- data.10m.1[data.10m.1$Region.Name %in% region,]
data.10m.2 <- data.10m.2[data.10m.2$Region.Name %in% region,]
data.10m.3 <- data.10m.3[data.10m.3$Region.Name %in% region,]
data.20m.1 <- data.20m.1[data.20m.1$Region.Name %in% region,]
data.20m.2 <- data.20m.2[data.20m.2$Region.Name %in% region,]
data.20m.3 <- data.20m.3[data.20m.3$Region.Name %in% region,]
data.TOTAL.1 <- data.TOTAL.1[data.TOTAL.1$Region.Name %in% region,]
data.TOTAL.2 <- data.TOTAL.2[data.TOTAL.2$Region.Name %in% region,]

data.5m.1$Region.Name
region
region <- c(region)


data.5m.1 <- data.5m.1[grep("alt",data.5m.1$Region.Name),]
data.5m.2 <- data.5m.2[grep("alt",data.5m.2$Region.Name),]
data.5m.3 <- data.5m.3[grep("alt",data.5m.3$Region.Name),]
data.10m.1 <- data.10m.1[grep("alt",data.10m.1$Region.Name),]
data.10m.2 <- data.10m.2[grep("alt",data.10m.2$Region.Name),]
data.10m.3 <- data.10m.3[grep("alt",data.10m.3$Region.Name),]
data.20m.1 <- data.20m.1[grep("alt",data.20m.1$Region.Name),]
data.20m.2 <- data.20m.2[grep("alt",data.20m.2$Region.Name),]
data.20m.3 <- data.20m.3[grep("alt",data.20m.3$Region.Name),]
data.TOTAL.1 <- data.TOTAL.1[grep("alt",data.TOTAL.1$Region.Name),]
data.TOTAL.2 <- data.TOTAL.2[grep("alt",data.TOTAL.2$Region.Name),]

length(extracted)
data.TOTAL.2$Region.Name

consider1 <- unique(data.5m.1$Region.Name,data.5m.2$Region.Name,data.5m.3$Region.Name)
consider2 <- unique(data.10m.1$Region.Name,data.10m.2$Region.Name,data.10m.3$Region.Name)
consider3 <- unique(data.20m.1$Region.Name,data.20m.2$Region.Name,data.20m.3$Region.Name)
consider4 <- unique(data.TOTAL.2$Region.Name,data.TOTAL.1$Region.Name)
cons <- intersect(consider1,consider2)
consider <- intersect(cons,consider3)
consider <- intersect(consider,consider4)
region <- consider

consider1 <- intersect(data.5m.1$Region.Name,data.5m.2$Region.Name)
consider1 <- intersect(consider1,data.5m.3$Region.Name)
consider2 <- intersect(data.10m.1$Region.Name,data.10m.2$Region.Name)
consider2 <- intersect(consider2,data.10m.3$Region.Name)
consider3 <- intersect(data.20m.1$Region.Name,data.20m.2$Region.Name)
consider3 <- intersect(consider3,data.20m.3$Region.Name)
consider4 <- intersect(data.TOTAL.2$Region.Name,data.TOTAL.1$Region.Name)
cons <- intersect(consider1,consider2)
consider <- intersect(cons,consider3)
consider <- intersect(consider,consider4)
region <- consider

#plotting mean for each intersecting gene
id <- region[1]
id

for (id in region)
{
  region
}

pdf("genes_gtf_intersectforeachtimepoint_line_graphs_for_each_gene.pdf")
for(id in region)
{
print(id)
k5_1 <- data.5m.1[grep(id,data.5m.1$Region.Name),]
k5_1 <- k5_1[,4:ncol(k5_1)-1]
k5_2 <- data.5m.2[grep(id,data.5m.2$Region.Name),]
k5_2 <- k5_2[,4:ncol(k5_2)-1]
k5_3 <- data.5m.3[grep(id,data.5m.3$Region.Name),]
k5_3 <- k5_3[,4:ncol(k5_3)-1]
k5 <- rbind(k5_1,k5_2,k5_3)
k5 <- colMeans(k5,na.rm = TRUE)

k10_1 <- data.10m.1[grep(id,data.10m.1$Region.Name),]
k10_1 <- k10_1[,4:ncol(k10_1)-1]
k10_2 <- data.10m.2[grep(id,data.10m.2$Region.Name),]
k10_2 <- k10_2[,4:ncol(k10_2)-1]
k10_3 <- data.10m.3[grep(id,data.10m.3$Region.Name),]
k10_3 <- k10_3[,4:ncol(k10_3)-1]
k10 <- rbind(k10_1,k10_2,k10_3)
k10 <- colMeans(k10,na.rm = TRUE)

k20_1 <- data.20m.1[grep(id,data.20m.1$Region.Name),]
k20_1 <- k20_1[,4:ncol(k20_1)-1]
k20_2 <- data.20m.2[grep(id,data.20m.2$Region.Name),]
k20_2 <- k20_2[,4:ncol(k20_2)-1]
k20_3 <- data.20m.3[grep(id,data.20m.3$Region.Name),]
k20_3 <- k20_3[,4:ncol(k20_3)-1]
k20 <- rbind(k20_1,k20_2,k20_3)
k20 <- colMeans(k20,na.rm = TRUE)

kTOTAL_1 <- data.TOTAL.1[grep(id,data.TOTAL.1$Region.Name),]
kTOTAL_1 <- kTOTAL_1[,4:ncol(kTOTAL_1)-1]
kTOTAL_2 <- data.TOTAL.2[grep(id,data.TOTAL.2$Region.Name),]
kTOTAL_2 <- kTOTAL_2[,4:ncol(kTOTAL_2)-1]
kTOTAL <- rbind(kTOTAL_1,kTOTAL_2)
kTOTAL <- colMeans(kTOTAL,na.rm = TRUE)
kTOTAL

if((sum(!is.na(k5)) == 0) | (sum(!is.na(k10)) == 0) | (sum(!is.na(k20)) == 0) | (sum(!is.na(kTOTAL)) == 0))
{next}

avg.data.table <- data.frame(time = c(rep("5m", length(k5)*1),
                                      rep("10m", length(k10)*1),
                                      rep("20m", length(k20)*1),
                                      rep("TOTAL", length(kTOTAL)*1)),
                             rep = c(rep(c("rep1"), each=length(k5)),
                                     rep(c("rep1"), each=length(k10)),
                                     rep(c("rep1"), each=length(k20)),
                                     rep(c("rep1"),each=length(kTOTAL))),
                             position=rep(c(-1000:999),4),
                             cov = c(k5, k10, k20, kTOTAL))
avg.data.table$time <- factor(avg.data.table$time, levels=c("5m","10m","20m","TOTAL"))

print(ggplot(avg.data.table, aes(x=position, y=cov, color=factor(time), alpha=factor(rep))) + geom_line(alpha=1) + 
  labs(x="position",y="coverage",color="timepoint") + ggtitle(id))

k5
k10
k20
kTOTAL
}
dev.off()

id <- "gene_id:FBgn0013700;single_0"