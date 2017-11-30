#setting working directories
getwd()
setwd("/Volumes/data/nm/anishns/nascentdata/")

#reading the data
data.5m.1.minima <- read.delim("kinetics_coverage_minima_data_5m_1.gtf.bed",sep="\t")
data.5m.2.minima <- read.delim("kinetics_coverage_minima_data_5m_2.gtf.bed",sep="\t")
data.5m.3.minima <- read.delim("kinetics_coverage_minima_data_5m_3.gtf.bed",sep="\t")
data.10m.1.minima <- read.delim("kinetics_coverage_minima_data_10m_1.gtf.bed",sep="\t")
data.10m.2.minima <- read.delim("kinetics_coverage_minima_data_10m_2.gtf.bed",sep="\t")
data.10m.3.minima <- read.delim("kinetics_coverage_minima_data_10m_3.gtf.bed",sep="\t")
data.20m.1.minima <- read.delim("kinetics_coverage_minima_data_20m_1.gtf.bed",sep="\t")
data.20m.2.minima <- read.delim("kinetics_coverage_minima_data_20m_2.gtf.bed",sep="\t")
data.20m.3.minima <- read.delim("kinetics_coverage_minima_data_20m_3.gtf.bed",sep="\t")
data.TOTAL.1.minima <- read.delim("kinetics_coverage_minima_data_TOTAL_1.gtf.bed",sep = "\t")
data.TOTAL.2.minima <- read.delim("kinetics_coverage_minima_data_TOTAL_2.gtf.bed",sep = "\t")

data.5m.1.upstream <- read.delim("kinetics_coverage_upstream_data_5m_1.gtf.bed",sep="\t")
data.5m.2.upstream <- read.delim("kinetics_coverage_upstream_data_5m_2.gtf.bed",sep="\t")
data.5m.3.upstream <- read.delim("kinetics_coverage_upstream_data_5m_3.gtf.bed",sep="\t")
data.10m.1.upstream <- read.delim("kinetics_coverage_upstream_data_10m_1.gtf.bed",sep="\t")
data.10m.2.upstream <- read.delim("kinetics_coverage_upstream_data_10m_2.gtf.bed",sep="\t")
data.10m.3.upstream <- read.delim("kinetics_coverage_upstream_data_10m_3.gtf.bed",sep="\t")
data.20m.1.upstream <- read.delim("kinetics_coverage_upstream_data_20m_1.gtf.bed",sep="\t")
data.20m.2.upstream <- read.delim("kinetics_coverage_upstream_data_20m_2.gtf.bed",sep="\t")
data.20m.3.upstream <- read.delim("kinetics_coverage_upstream_data_20m_3.gtf.bed",sep="\t")
data.TOTAL.1.upstream <- read.delim("kinetics_coverage_upstream_data_TOTAL_1.gtf.bed",sep = "\t")
data.TOTAL.2.upstream <- read.delim("kinetics_coverage_upstream_data_TOTAL_2.gtf.bed",sep = "\t")

#assigning column names
colnames(data.5m.1.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.5m.2.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.5m.3.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.10m.1.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.10m.2.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.10m.3.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.20m.1.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.20m.2.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.20m.3.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.TOTAL.1.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.TOTAL.2.minima) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")

colnames(data.5m.1.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.5m.2.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.5m.3.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.10m.1.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.10m.2.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.10m.3.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.20m.1.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.20m.2.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.20m.3.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.TOTAL.1.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")
colnames(data.TOTAL.2.upstream) <- c("chr","pos1","pos2","key","length","strand","reads","s2","s3","fraction")

#finding the common genes
region <- intersect(data.5m.1.minima$key,data.5m.2.minima$key)
region <- intersect(region,data.5m.3.minima$key)
region <- intersect(region,data.10m.1.minima$key)
region <- intersect(region,data.10m.2.minima$key)
region <- intersect(region,data.10m.3.minima$key)
region <- intersect(region,data.20m.1.minima$key)
region <- intersect(region,data.20m.2.minima$key)
region <- intersect(region,data.20m.3.minima$key)
region <- intersect(region,data.TOTAL.1.minima$key)
region <- intersect(region,data.TOTAL.2.minima$key)
region <- intersect(region,data.5m.1.upstream$key)
region <- intersect(region,data.5m.2.upstream$key)
region <- intersect(region,data.5m.3.upstream$key)
region <- intersect(region,data.10m.1.upstream$key)
region <- intersect(region,data.10m.2.upstream$key)
region <- intersect(region,data.10m.3.upstream$key)
region <- intersect(region,data.20m.1.upstream$key)
region <- intersect(region,data.20m.2.upstream$key)
region <- intersect(region,data.20m.3.upstream$key)
region <- intersect(region,data.TOTAL.1.upstream$key)
region <- intersect(region,data.TOTAL.2.upstream$key)

#plotting the graph for all genes in a loop
pdf("kinematics_gtf_for_each_gene.pdf")
for(key in region[1:1000])
{
  print(key)
  k5.1_min <- data.5m.1.minima[grep(key,data.5m.1.minima$key),]$reads
  k5.2_min <- data.5m.2.minima[grep(key,data.5m.2.minima$key),]$reads
  k5.3_min <- data.5m.3.minima[grep(key,data.5m.3.minima$key),]$reads
  k10.1_min <- data.10m.1.minima[grep(key,data.10m.1.minima$key),]$reads
  k10.2_min <- data.10m.2.minima[grep(key,data.10m.2.minima$key),]$reads
  k10.3_min <- data.10m.3.minima[grep(key,data.10m.3.minima$key),]$reads
  k20.1_min <- data.20m.1.minima[grep(key,data.20m.1.minima$key),]$reads
  k20.2_min <- data.20m.2.minima[grep(key,data.20m.2.minima$key),]$reads
  k20.3_min <- data.20m.3.minima[grep(key,data.20m.3.minima$key),]$reads
  kTOTAL.1_min <- data.TOTAL.1.minima[grep(key,data.TOTAL.1.minima$key),]$reads
  kTOTAL.2_min <- data.TOTAL.2.minima[grep(key,data.TOTAL.2.minima$key),]$reads
  
  k5.1_up <- data.5m.1.upstream[grep(key,data.5m.1.upstream$key),]$reads
  k5.2_up <- data.5m.2.upstream[grep(key,data.5m.2.upstream$key),]$reads
  k5.3_up <- data.5m.3.upstream[grep(key,data.5m.3.upstream$key),]$reads
  k10.1_up <- data.10m.1.upstream[grep(key,data.10m.1.upstream$key),]$reads
  k10.2_up <- data.10m.2.upstream[grep(key,data.10m.2.upstream$key),]$reads
  k10.3_up <- data.10m.3.upstream[grep(key,data.10m.3.upstream$key),]$reads
  k20.1_up <- data.20m.1.upstream[grep(key,data.20m.1.upstream$key),]$reads
  k20.2_up <- data.20m.2.upstream[grep(key,data.20m.2.upstream$key),]$reads
  k20.3_up <- data.20m.3.upstream[grep(key,data.20m.3.upstream$key),]$reads
  kTOTAL.1_up <- data.TOTAL.1.upstream[grep(key,data.TOTAL.1.upstream$key),]$reads
  kTOTAL.2_up <- data.TOTAL.2.upstream[grep(key,data.TOTAL.2.upstream$key),]$reads
  
  d1 <- k5.1_min / k5.1_up
  d2 <- k5.2_min / k5.2_up
  d3 <- k5.3_min / k5.3_up
  d4 <- k10.1_min / k10.1_up
  d5 <- k10.2_min / k10.2_up
  d6 <- k10.3_min / k10.3_up
  d7 <- k20.1_min / k20.1_up
  d8 <- k20.2_min / k20.2_up
  d9 <- k20.3_min / k20.3_up
  d10 <- kTOTAL.1_min / kTOTAL.1_up
  d11 <- kTOTAL.2_min / kTOTAL.2_up
  
  k5 = d1 + d2 + d3
  k10 = d4 + d5 +d6
  k20 = d7 + d8 + d9
  kTOTAL = d10 + d11
  if((sum(!is.na(k5)) == 0) | (sum(!is.na(k10)) == 0) | (sum(!is.na(k20)) == 0) | (sum(!is.na(kTOTAL)) == 0))
  {next}
  
  k <- data.frame(tps = c(rep(c(5,10,20,60), 3)),
                  reps = c(rep(c("rep1","rep2","rep3"),each=4)),
                  ratios = c(c(d1,d4,d7,d10),c(d2,d5,d8,d11),c(d3,d6,d9,NA)))
  #k$tps <- factor(k$tps,levels = c("5m","10m","20m","TOTAL"))
  print(ggplot(data = k,aes(x = tps,y=ratios,color=factor(reps))) + geom_point() + scale_y_continuous(limits = c(0.0,1.5)) + labs(y = "Fraction (reads minima/reads upstream)") + theme_bw() + ggtitle(key))
}
dev.off()