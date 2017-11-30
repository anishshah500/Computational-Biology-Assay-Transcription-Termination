setwd("/Volumes/data/nm/anishns/nascentdata/")

pdf("upstream_elements.pdf")
upstream_element_data_gtf <- read.delim("upstream_data_element_plotting_gtf.txt",sep="\t")
colnames(upstream_element_data_gtf) <- c("element","position")

print(ggplot(upstream_element_data_gtf,aes(x = position,fill = element)) + geom_histogram(binwidth = 1) + ggtitle("gtf with repetion for minority eles"))
print(ggplot(upstream_element_data_gtf,aes(x = position,color = element)) + geom_density() + ggtitle("gtf with repetion for minority eles"))

upstream_element_data_polyA <- read.delim("upstream_data_element_plotting_polyA.txt",sep="\t")
colnames(upstream_element_data_polyA) <- c("element","position")

print(ggplot(upstream_element_data_polyA,aes(x = position,fill = element)) + geom_histogram(binwidth = 1) + ggtitle("polyAwith repetition for minority eles"))
print(ggplot(upstream_element_data_polyA,aes(x = position,color = element)) + geom_density() + ggtitle("polyAwith repetition for minority eles"))

ggplot(upstream_element_data_gtf[which(upstream_element_data_gtf$position > 50),],aes(x = position,color = element)) + geom_density()
ggplot(upstream_element_data_polyA[which(upstream_element_data_polyA$position > 50),],aes(x = position,color = element)) + geom_density()

norep_upstream_element_data_gtf <- read.delim("no_repetition_upstream_data_element_plotting_gtf.txt",sep="\t")
colnames(norep_upstream_element_data_gtf) <- c("element","position","gene_id")

print(ggplot(norep_upstream_element_data_gtf,aes(x = position,fill = element)) + geom_histogram(binwidth = 1) + ggtitle("gtf without repetion for minority eles"))
print(ggplot(norep_upstream_element_data_gtf,aes(x = position,color = element)) + geom_density() + ggtitle("gtf without repetion for minority eles"))

norep_upstream_element_data_polyA <- read.delim("no_repetition_upstream_data_element_plotting_polyA.txt",sep="\t")
colnames(norep_upstream_element_data_polyA) <- c("element","position")

print(ggplot(norep_upstream_element_data_polyA,aes(x = position,fill = element)) + geom_histogram(binwidth = 1) + ggtitle("polyA without repetition for minority eles"))
print(ggplot(norep_upstream_element_data_polyA,aes(x = position,color = element)) + geom_density() + ggtitle("polyA without repetition for minority eles"))

dev.off()

final_frame_gtf = c()
frame <- data.frame(upstream_element_data_gtf[which(upstream_element_data_gtf$element == 'ACTAAA'),])
frame$type = "major"
frame$type = "minor"
final_frame_gtf <- rbind(final_frame_gtf,frame)
tail(final_frame_gtf)

pdf("gtf upstream elements with repetition")
colnames(final_frame_gtf) <- c("element","position","type")
print(ggplot(final_frame_gtf,aes(x = position,color = type)) + geom_density() + ggtitle("gtf upstream elements with repetition"))
print(ggplot(final_frame_gtf,aes(x = position,fill = type)) + geom_histogram(binwidth = 1) + ggtitle("gtf upstream elements with repetition"))
dev.off()

final_frame_polyA = c()
frame <- data.frame(upstream_element_data_polyA[which(upstream_element_data_polyA$element == 'ACTAAA'),])
frame$type = "major"
frame$type = "minor"
final_frame_polyA <- rbind(final_frame_polyA,frame)
tail(final_frame_polyA)

pdf("polyA upstream elements with repetition")
colnames(final_frame_polyA) <- c("element","position","type")
print(ggplot(final_frame_polyA,aes(x = position,color = type)) + geom_density() + ggtitle("polyA upstream elements with repetition"))
print(ggplot(final_frame_polyA,aes(x = position,fill = type)) + geom_histogram(binwidth = 1) + ggtitle("polyA upstream elements with repetition"))
dev.off()

final_frame_gtf_norep = c()
frame <- data.frame(norep_upstream_element_data_gtf[which(norep_upstream_element_data_gtf$element == 'ACTAAA'),])
frame$type = "major"
frame$type = "minor"
final_frame_gtf_norep <- rbind(final_frame_gtf_norep,frame)
tail(final_frame_gtf_norep)

pdf("gtf upstream elements without repetition")
colnames(final_frame_gtf_norep) <- c("element","position","type")
print(ggplot(final_frame_gtf_norep,aes(x = position,color = type)) + geom_density() + ggtitle("gtf upstream elements without repetition"))
print(ggplot(final_frame_gtf_norep,aes(x = position,fill = type)) + geom_histogram(binwidth = 1) + ggtitle("gtf upstream elements without repetition"))
dev.off()

final_frame_polyA_norep = c()
frame <- data.frame(norep_upstream_element_data_polyA[which(norep_upstream_element_data_polyA$element == 'ACTAAA'),])
frame$type = "major"
frame$type = "minor"
final_frame_polyA_norep <- rbind(final_frame_polyA_norep,frame)
tail(final_frame_polyA_norep)

pdf("polyA upstream elements without repetition")
colnames(final_frame_polyA_norep) <- c("element","position","type")
print(ggplot(final_frame_polyA_norep,aes(x = position,color = type)) + geom_density() + ggtitle("polyA upstream elements without repetition"))
print(ggplot(final_frame_polyA_norep,aes(x = position,fill = type)) + geom_histogram(binwidth = 1) + ggtitle("polyA upstream elements without repetition"))
dev.off()

nrow(final_frame_gtf_norep[which(final_frame_gtf_norep$type == "minor"),])
nrow(final_frame_polyA_norep[which(final_frame_polyA_norep$type == "major"),])

positions_data_gtf <- read.delim("consider_positions_for_sequence_search_gtf.bed",sep="\t")
gtf_gene_ids <- positions_data_gtf$gene_id.FBgn0032923.alt_0
head(final_frame_gtf_norep)
nrow(positions_data_gtf)
nrow(final_frame_gtf_norep)

norep_upstream_element_data_gtf <- read.delim("no_repetition_upstream_data_element_plotting_gtf.txt",sep="\t")
colnames(norep_upstream_element_data_gtf) <- c("element","position","gene_id")
head(norep_upstream_element_data_gtf)
nrow(norep_upstream_element_data_gtf)
