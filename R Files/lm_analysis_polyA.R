getwd()
setwd("/Volumes/data/nm/anishns/nascentdata/")

data.5m.1.minima <- read.delim("kinetics_coverage_minima_data_5m_1.polyA.bed",sep="\t")
data.5m.2.minima <- read.delim("kinetics_coverage_minima_data_5m_2.polyA.bed",sep="\t")
data.5m.3.minima <- read.delim("kinetics_coverage_minima_data_5m_3.polyA.bed",sep="\t")
data.10m.1.minima <- read.delim("kinetics_coverage_minima_data_10m_1.polyA.bed",sep="\t")
data.10m.2.minima <- read.delim("kinetics_coverage_minima_data_10m_2.polyA.bed",sep="\t")
data.10m.3.minima <- read.delim("kinetics_coverage_minima_data_10m_3.polyA.bed",sep="\t")
data.20m.1.minima <- read.delim("kinetics_coverage_minima_data_20m_1.polyA.bed",sep="\t")
data.20m.2.minima <- read.delim("kinetics_coverage_minima_data_20m_2.polyA.bed",sep="\t")
data.20m.3.minima <- read.delim("kinetics_coverage_minima_data_20m_3.polyA.bed",sep="\t")
data.TOTAL.1.minima <- read.delim("kinetics_coverage_minima_data_TOTAL_1.polyA.bed",sep = "\t")
data.TOTAL.2.minima <- read.delim("kinetics_coverage_minima_data_TOTAL_2.polyA.bed",sep = "\t")

data.5m.1.upstream <- read.delim("kinetics_coverage_upstream_data_5m_1.polyA.bed",sep="\t")
data.5m.2.upstream <- read.delim("kinetics_coverage_upstream_data_5m_2.polyA.bed",sep="\t")
data.5m.3.upstream <- read.delim("kinetics_coverage_upstream_data_5m_3.polyA.bed",sep="\t")
data.10m.1.upstream <- read.delim("kinetics_coverage_upstream_data_10m_1.polyA.bed",sep="\t")
data.10m.2.upstream <- read.delim("kinetics_coverage_upstream_data_10m_2.polyA.bed",sep="\t")
data.10m.3.upstream <- read.delim("kinetics_coverage_upstream_data_10m_3.polyA.bed",sep="\t")
data.20m.1.upstream <- read.delim("kinetics_coverage_upstream_data_20m_1.polyA.bed",sep="\t")
data.20m.2.upstream <- read.delim("kinetics_coverage_upstream_data_20m_2.polyA.bed",sep="\t")
data.20m.3.upstream <- read.delim("kinetics_coverage_upstream_data_20m_3.polyA.bed",sep="\t")
data.TOTAL.1.upstream <- read.delim("kinetics_coverage_upstream_data_TOTAL_1.polyA.bed",sep = "\t")
data.TOTAL.2.upstream <- read.delim("kinetics_coverage_upstream_data_TOTAL_2.polyA.bed",sep = "\t")

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

region <- unique(data.5m.1.minima$key,data.5m.2.minima$key)
region <- unique(region,data.5m.3.minima$key)
region <- unique(region,data.10m.1.minima$key)
region <- unique(region,data.10m.2.minima$key)
region <- unique(region,data.10m.3.minima$key)
region <- unique(region,data.20m.1.minima$key)
region <- unique(region,data.20m.2.minima$key)
region <- unique(region,data.20m.3.minima$key)
region <- unique(region,data.TOTAL.1.minima$key)
region <- unique(region,data.TOTAL.2.minima$key)
region <- unique(region,data.5m.1.upstream$key)
region <- unique(region,data.5m.2.upstream$key)
region <- unique(region,data.5m.3.upstream$key)
region <- unique(region,data.10m.1.upstream$key)
region <- unique(region,data.10m.2.upstream$key)
region <- unique(region,data.10m.3.upstream$key)
region <- unique(region,data.20m.1.upstream$key)
region <- unique(region,data.20m.2.upstream$key)
region <- unique(region,data.20m.3.upstream$key)
region <- unique(region,data.TOTAL.1.upstream$key)
region <- unique(region,data.TOTAL.2.upstream$key)

#t <- data.frame(gene_id=NA, slope =NA, half_life =NA, stringsAsFactors = FALSE)
#t <- t[-1,]
t <- c()
i = 0


for(key in region)
{
  i = i+1
  print(i)
  print(key)
  k5.1_min <- data.5m.1.minima[which(as.character(data.5m.1.minima$key) == key),]$reads
  k5.2_min <- data.5m.2.minima[which(as.character(data.5m.2.minima$key) == key),]$reads
  k5.3_min <- data.5m.3.minima[which(as.character(data.5m.3.minima$key) == key),]$reads
  k10.1_min <- data.10m.1.minima[which(as.character(data.10m.1.minima$key) == key),]$reads
  k10.2_min <- data.10m.2.minima[which(as.character(data.10m.2.minima$key) == key),]$reads
  k10.3_min <- data.10m.3.minima[which(as.character(data.10m.3.minima$key) == key),]$reads
  k20.1_min <- data.20m.1.minima[which(as.character(data.20m.1.minima$key) == key),]$reads
  k20.2_min <- data.20m.2.minima[which(as.character(data.20m.2.minima$key) == key),]$reads
  k20.3_min <- data.20m.3.minima[which(as.character(data.20m.3.minima$key) == key),]$reads
  kTOTAL.1_min <- data.TOTAL.1.minima[which(as.character(data.TOTAL.1.minima$key) == key),]$reads
  kTOTAL.2_min <- data.TOTAL.2.minima[which(as.character(data.TOTAL.2.minima$key) == key),]$reads
  
  k5.1_up <- data.5m.1.upstream[which(as.character(data.5m.1.upstream$key) == key),]$reads
  k5.2_up <- data.5m.2.upstream[which(as.character(data.5m.2.upstream$key) == key),]$reads
  k5.3_up <- data.5m.3.upstream[which(as.character(data.5m.3.upstream$key) == key),]$reads
  k10.1_up <- data.10m.1.upstream[which(as.character(data.10m.1.upstream$key) == key),]$reads
  k10.2_up <- data.10m.2.upstream[which(as.character(data.10m.2.upstream$key) == key),]$reads
  k10.3_up <- data.10m.3.upstream[which(as.character(data.10m.3.upstream$key) == key),]$reads
  k20.1_up <- data.20m.1.upstream[which(as.character(data.20m.1.upstream$key) == key),]$reads
  k20.2_up <- data.20m.2.upstream[which(as.character(data.20m.2.upstream$key) == key),]$reads
  k20.3_up <- data.20m.3.upstream[which(as.character(data.20m.3.upstream$key) == key),]$reads
  kTOTAL.1_up <- data.TOTAL.1.upstream[which(as.character(data.TOTAL.1.upstream$key) == key),]$reads
  kTOTAL.2_up <- data.TOTAL.2.upstream[which(as.character(data.TOTAL.2.upstream$key) == key),]$reads
  
  d1 <- log(k5.1_min / k5.1_up)
  d2 <- log(k5.2_min / k5.2_up)
  d3 <- log(k5.3_min / k5.3_up)
  d4 <- log(k10.1_min / k10.1_up)
  d5 <- log(k10.2_min / k10.2_up)
  d6 <- log(k10.3_min / k10.3_up)
  d7 <- log(k20.1_min / k20.1_up)
  d8 <- log(k20.2_min / k20.2_up)
  d9 <- log(k20.3_min / k20.3_up)
  #d10 <- log(kTOTAL.1_min / kTOTAL.1_up)
  #d11 <- log(kTOTAL.2_min / kTOTAL.2_up)
  
  k5 = d1 + d2 + d3
  k10 = d4 + d5 +d6
  k20 = d7 + d8 + d9
  
  if((sum(!is.na(k5)) == 0) | (sum(!is.na(k10)) == 0) | (sum(!is.na(k20)) == 0))
  {next}
  
  if(is.infinite(k5) | is.infinite(k10) | is.infinite(k20))
  {next}
  
  k <- data.frame(tps = c(rep(c(0,5,10,20), 3)),
                  reps = c(rep(c("rep1","rep2","rep3"),each=4)),
                  ratios = c(c(0,d1,d4,d7),c(0,d2,d5,d8),c(0,d3,d6,d9)))
  
  test.lm = lm(tps ~ ratios,data = k)
  slope <- coefficients(test.lm)[2]
  half_l <-  (log(2) / slope) * -1
  newrow = data.frame(gene_id = as.character(key),slope = as.numeric(slope), half_life = as.numeric(half_l))
  print(newrow)
  t[sapply(t, is.factor)] <- lapply(t[sapply(t, is.factor)], as.character)
  t <- rbind(t,newrow)
}

half_life_polyA <- t
colnames(half_life_polyA) <- c("gene_id","slope","half_life")
head(half_life_polyA)

pdf("LM fit analyis for polyA.pdf")
print(ggplot(half_life_polyA,aes(half_life)) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + theme_bw() + scale_x_continuous(limits = c(-1,1)) + ggtitle("half life for polyA annotations") + labs(x = "Half Life"))
print(ggplot(half_life_polyA,aes(slope)) + geom_histogram(aes(fill = ..count..),binwidth=1) + theme_bw() + scale_x_continuous(limits = c(-25,25)) + ggtitle("half life for polyA annotations") + labs(x = "Slope"))
dev.off()
