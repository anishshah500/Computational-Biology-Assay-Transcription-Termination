#setting the working directory
getwd()
setwd("/Volumes/data/nm/anishns/nascentdata")

#reading the minima read data in
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

#reading the upstream read data in
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

#assigning the column names
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

#getting each gene
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

#defining the data frame
t <- c()
i = 0

#actual looping through the data and add the information to the table if all the values are finite
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
  slope <- coefficients(test.lm)[2]
  half_l <-  (log(2) / slope) * -1
  newrow = data.frame(gene_id = as.character(key),slope = as.numeric(slope), half_life = as.numeric(half_l))
  print(newrow)
  t[sapply(t, is.factor)] <- lapply(t[sapply(t, is.factor)], as.character)
  t <- rbind(t,newrow)
}

half_life_gtf <- t
colnames(half_life_gtf) <- c("gene_id","slope","half_life","RSquared","p_value")
head(half_life_gtf)

t_single0 <- data.frame(gene_id=NA, slope =NA, half_life =NA, stringsAsFactors = FALSE)
t_single0 <- t_single0[-1,]
i = 0

half_life_gtf_single0 <- half_life_gtf[grep("single_0",half_life_gtf$gene_id),]
half_life_gtf_altn <- half_life_gtf[grep("alt_",half_life_gtf$gene_id),]
head(half_life_gtf_single0)

half_life_gtf_alt0 <- half_life_gtf[grep("alt_0",half_life_gtf$gene_id),]
half_life_gtf_alt1 <- half_life_gtf[grep("alt_1",half_life_gtf$gene_id),]
half_life_gtf_alt2 <- half_life_gtf[grep("alt_2",half_life_gtf$gene_id),]

pdf("half_lifes for single_0 and alt_n gtf genes.pdf")
print(ggplot(half_life_gtf_single0,aes(as.numeric(half_life))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + scale_x_continuous(limits = c(-1,1)) + labs(x = "half life for single_0 gtf genes")) + stat_ecdf()
print(ggplot(half_life_gtf_altn,aes(as.numeric(half_life))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + scale_x_continuous(limits = c(-1,1)) + labs(x = "half life for alt_n gtf genes")) + stat_ecdf()
print(ggplot(half_life_gtf_alt0,aes(as.numeric(half_life))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + scale_x_continuous(limits = c(-1,1)) + labs(x = "half life for alt_0 gtf genes")) + stat_ecdf()
print(ggplot(half_life_gtf_alt1,aes(as.numeric(half_life))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + scale_x_continuous(limits = c(-1,1)) + labs(x = "half life for alt_1 gtf genes")) + stat_ecdf()
print(ggplot(half_life_gtf_alt2,aes(as.numeric(half_life))) + geom_histogram(aes(fill = ..count..),binwidth = 0.01) + scale_x_continuous(limits = c(-1,1)) + labs(x = "half life for alt_2 gtf genes")) + stat_ecdf()
dev.off()

nrow(half_life_gtf_alt2)

half_life_gtf_alt0 <- half_life_gtf[grep("alt_0",half_life_gtf$gene_id),]
half_life_gtf_alt1 <- half_life_gtf[grep("alt_1",half_life_gtf$gene_id),]
half_life_gtf_alt2 <- half_life_gtf[grep("alt_2",half_life_gtf$gene_id),]
half_life_gtf_alt3 <- half_life_gtf[grep("alt_3",half_life_gtf$gene_id),]

k0 <- data.frame(gene_id = half_life_gtf_alt0$gene_id, slope = (as.numeric(half_life_gtf_alt0$slope)), half_life = as.numeric(half_life_gtf_alt0$half_life))
k1 <- data.frame(gene_id = half_life_gtf_alt1$gene_id, slope = (as.numeric(half_life_gtf_alt1$slope)), half_life = as.numeric(half_life_gtf_alt1$half_life))
k2 <- data.frame(gene_id = half_life_gtf_alt2$gene_id, slope = (as.numeric(half_life_gtf_alt2$slope)), half_life = as.numeric(half_life_gtf_alt2$half_life))
k3 <- data.frame(gene_id = half_life_gtf_alt3$gene_id, slope = (as.numeric(half_life_gtf_alt3$slope)), half_life = as.numeric(half_life_gtf_alt3$half_life))
k4 <- data.frame(gene_id = half_life_gtf_single0$gene_id, slope = (as.numeric(half_life_gtf_single0$slope)), half_life = as.numeric(half_life_gtf_single0$half_life))
k0 <- half_life_gtf_alt0
k1 <- half_life_gtf_alt1
k2 <- half_life_gtf_alt2
k3 <- half_life_gtf_alt3
k4 <- half_life_gtf_single0
k0$DataSource <- 'alt_0'
k1$DataSource <- 'alt_1'
k2$DataSource <- 'alt_2'
k3$DataSource <- 'alt_3'
k4$DataSource <- 'single_0'
combine <- rbind(k0,k1,k2,k3,k4)
tail(combine)
head(combine)

rnorm(combine$slope)

pdf("single_and_alt_genes_kinematics_with_line_and_ecdf_gtf.pdf")
print(ggplot(combine, aes(slope, fill = DataSource)) + geom_histogram(alpha = 0.5) + ggtitle("Histogram for all alt and single genes"))
print(ggplot(combine, aes(slope, fill = DataSource)) + geom_density(alpha = 0.1) + ggtitle("Density graph for all single and alt"))
print(ggplot(combine, aes(slope, colour = DataSource)) + geom_density(alpha = 0.5) + ggtitle("Density graph for all single and alt"))
print(ggplot(combine, aes(slope, colour = DataSource)) + stat_ecdf() + ggtitle("Stat_ECDF graph for all single and alt"))
print(ggplot(combine, aes(half_life, fill = DataSource)) + geom_histogram(binwidth = 0.01,alpha = 0.5) + scale_x_continuous(limits = c(-1,1)) + ggtitle("Histogram for all alt and single genes"))
print(ggplot(combine, aes(half_life, fill = DataSource)) + geom_density(alpha = 0.1) + scale_x_continuous(limits = c(-1,1)) + ggtitle("Density graph for all single and alt"))
print(ggplot(combine, aes(half_life, colour = DataSource)) + geom_density(alpha = 0.5) + scale_x_continuous(limits = c(-1,1)) +ggtitle("Density graph for all single and alt"))
print(ggplot(combine, aes(half_life, colour = DataSource)) + stat_ecdf() + scale_x_continuous(limits = c(-1,1)) + ggtitle("Stat_ECDF graph for all single and alt"))
dev.off()

#incorporating tpm data
tpm_data <- read.delim("adelman_abundance.gene",sep = "\t")
tpm_data$names <- rownames(tpm_data)

ch <- unlist(lapply(strsplit(as.character(lapply(strsplit(as.character(combine$gene_id),";"),"[",1)),":"),"[",2))

test_df1 <- data.frame("gene_id","tpm")
test_df1 <- test_df1[-1,]

for (i in ch)
{
  print(i)
  k1 <- tpm_data[which(tpm_data$names == i),]$Adelman4sU_TOTAL_abundance
  if(length(k1) == 0)
  newrow <- c(as.character(i),0)
  else
  newrow <- c(as.character(i),as.numeric(k1))
  print(newrow)
  test_df1 <- rbind(test_df1,newrow)
  test_df1[sapply(test_df1, is.factor)] <- lapply(test_df1[sapply(test_df1, is.factor)], as.character)
}

colnames(test_df1) <- c("gene_id","tpm")
head(test_df1)
head(combine)
combine$tpm = test_df1$tpm
head(combine)

pdf("single_and_alt_genes_kinetics_with_line_and_ecdf_with_tpm.pdf")
print(ggplot(subset(combine,combine$tpm > 2), aes(slope, fill = DataSource)) + geom_histogram(alpha = 0.5) + ggtitle("Histogram for all alt and single genes with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(slope, fill = DataSource)) + geom_density(alpha = 0.1) + ggtitle("Density graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(slope, colour = DataSource)) + geom_density(alpha = 0.5) + ggtitle("Density graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(slope, colour = DataSource)) + geom_density(alpha = 0.5) + ggtitle("Density graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(slope, colour = DataSource)) + stat_ecdf() + ggtitle("Stat_ECDF graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(half_life, fill = DataSource)) + geom_histogram(alpha = 0.5) + scale_x_continuous(limits = c(-1,1)) + ggtitle("Histogram for all alt and single genes with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(half_life, fill = DataSource)) + geom_density(alpha = 0.1) + scale_x_continuous(limits = c(-1,1)) + ggtitle("Density graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(half_life, colour = DataSource)) + geom_density(alpha = 0.5) + scale_x_continuous(limits = c(-1,1)) + ggtitle("Density graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(half_life, colour = DataSource)) + geom_density(alpha = 0.5) + scale_x_continuous(limits = c(-1,1)) + ggtitle("Density graph for all single and alt with tpm selection"))
print(ggplot(subset(combine,combine$tpm > 2), aes(half_life, colour = DataSource)) + stat_ecdf() + scale_x_continuous(limits = c(-1,1)) + ggtitle("Stat_ECDF graph for all single and alt with tpm selection"))
dev.off()

ggplot(subset(combine,combine$tpm > 2),aes(as.numeric(slope))) + geom_histogram(aes(fill = ..count..),binwidth = 0.1) + theme_bw() + labs(x = "Slope")

ggplot(subset(combine,combine$tpm > 2),aes(x = as.numeric(slope),y = as.numeric(p_value))) + geom_point() + theme_bw() + ggtitle("slope vs p-value")

colnames(combine)