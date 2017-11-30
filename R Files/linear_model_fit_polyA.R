getwd()
setwd("/Volumes/data/nm/anishns/nascentdata/kinetics")

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

t <- data.frame(gene_id=NA, slope =NA, RSquared =NA, p_value =NA, stringsAsFactors = FALSE)
t <- t[-1,]
i = 0

for(key in region)
{
i = i+1
print(i)
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
rsquared <- summary(test.lm)$adj.r.squared
p_val <- summary(test.lm)$coefficients[,4][2]
newrow = c(gene_id = as.character(key),slope = as.numeric(slope),RSquared = rsquared,p_value = as.numeric(p_val))
print(newrow)
t[sapply(t, is.factor)] <- lapply(t[sapply(t, is.factor)], as.character)
t <- rbind(t,newrow)
}

na.omit(t)

result_polyA <- t
colnames(result_polyA) <- c("gene_id","slope","r_sq","p_value")
head(result_polyA)

pdf("lm_statistics_polyA.pdf")
{
print(ggplot(result_polyA,aes(as.numeric(slope))) + geom_histogram(aes(fill = ..count..),binwidth = 1) + theme_bw() + labs(x = "Slope"))
print(ggplot(result_polyA,aes(as.numeric(r_sq))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + theme_bw() + labs(x = "R Square"))
print(ggplot(result_polyA,aes(as.numeric(p_value))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + theme_bw() + labs(x = "P Value"))
}

dev.off()