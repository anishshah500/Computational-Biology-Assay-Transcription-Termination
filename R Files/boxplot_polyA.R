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

matching.indices <- match(data.5m.1.minima$key, data.5m.1.upstream$key)

k <- data.frame(tps = rep(c("5m","10m","20m","total"), each=nrow(data.5m.1.minima)*3),
                reps = rep(rep(c("rep1","rep2","rep3"), each=nrow(data.5m.1.minima)),4),
                ratios = c(c(data.5m.1.minima$reads/data.5m.1.upstream$reads[matching.indices],data.5m.2.minima$reads/data.5m.2.upstream$reads[matching.indices],data.5m.3.minima$reads/data.5m.3.upstream$reads[matching.indices]),
                           c(data.10m.1.minima$reads/data.10m.1.upstream$reads[matching.indices],data.10m.2.minima$reads/data.10m.2.upstream$reads[matching.indices],data.10m.3.minima$reads/data.10m.3.upstream$reads[matching.indices]),
                           c(data.20m.1.minima$reads/data.20m.1.upstream$reads[matching.indices],data.20m.2.minima$reads/data.20m.2.upstream$reads[matching.indices],data.20m.3.minima$reads/data.20m.3.upstream$reads[matching.indices]),
                           c(data.TOTAL.1.minima$reads/data.TOTAL.1.upstream$reads[matching.indices],data.TOTAL.2.minima$reads/data.TOTAL.2.upstream$reads[matching.indices],rep(NA, nrow(data.5m.1.minima)))))
k$tps <- factor(k$tps, levels=c("5m","10m","20m","total"))

pdf("boxplot_without_log_y-axis_polyA.pdf")
#plot the actual boxplot
print(ggplot(k, aes(x=factor(tps),y=ratios,fill=factor(reps))) + geom_boxplot(notch=T) + ylim(0,1) + theme_bw() + ggtitle("Boxplot for polyA"))
dev.off()

#plot with log scale
ggplot(data = k,aes(x = factor(tps),y = ratios, color = factor(reps))) + geom_boxplot(notch=T) + scale_y_log10() + theme_bw()
