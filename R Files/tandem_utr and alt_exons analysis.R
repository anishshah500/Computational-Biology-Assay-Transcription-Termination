setwd("/Volumes/data/nm/anishns/nascentdata/")

#reading data
types_of_alt <- read.delim("types_of_alternative_exons_without_positions.txt",sep="\t")
head(types_of_alt)
 colnames(types_of_alt) <- c("chr","start","end","gene_id_consider","strand","type")

#extracting the gene ids for each instance
tandem_utrs <- types_of_alt[which(types_of_alt$type == "Tandem UTRs"),]
tandem_utrs <- data.frame(lapply(tandem_utrs, as.character), stringsAsFactors=FALSE)
tandem_utrs_geneids <- unlist(strsplit(tandem_utrs$gene_id_consider,";"))
alt_exons <- types_of_alt[which(types_of_alt$type == "Alternative Last Exons"),]
alt_exons <- data.frame(lapply(alt_exons, as.character), stringsAsFactors=FALSE)
alt_exons_geneids <- unlist(strsplit(alt_exons$gene_id_consider,";"))
head(alt_exons_geneids)

#defining data frames
df_tutrs <- c()
df_altexons <- c()

#extracting gene ids from half_life_gtf data frame
half_life_gtf_modified <- half_life_gtf
for(k in (1:nrow(half_life_gtf)))
{
  half_life_gtf_modified[k,]$gene_id <- (unlist(strsplit(unlist(strsplit(half_life_gtf[k,]$gene_id,";")),":"))[2])
}

#looping through the data and extracting half life data by comparing gene ids and adding them to particular frame
for(k in (1:nrow(half_life_gtf_modified)))
{
  print(k)
  gtf_gene_id <- (unlist(strsplit(unlist(strsplit(half_life_gtf[k,]$gene_id,";")),":"))[2])
  print(gtf_gene_id)
  if(gtf_gene_id %in% tandem_utrs_geneids)
  {
    newrow <- data.frame(half_life_gtf_modified[which(half_life_gtf_modified$gene_id == gtf_gene_id),])
    df_tutrs <- rbind(df_tutrs,newrow)
  }
  if(gtf_gene_id %in% alt_exons_geneids)
  {
    newrow <- data.frame(half_life_gtf_modified[which(half_life_gtf_modified$gene_id == gtf_gene_id),])
    df_altexons <- rbind(df_altexons,newrow)
  }
}

#assinging types to particular frames and combining them to obtain the data frame for plotting
df_tutrs$type = "Tandem UTRs"
df_altexons$type = "Alternative Exons"
combined_data <- rbind(df_tutrs,df_altexons)

#final plotting
pdf("tandem_vs_alt_half_lifes_gtf.pdf")
print(ggplot(combined_data,aes(half_life,fill = type)) + geom_histogram(binwidth = 0.01,alpha = 0.5) + scale_x_continuous(limits = c(-0.5,0.5)))
print(ggplot(combined_data,aes(half_life,color = type)) + geom_density(alpha = 0.5) + scale_x_continuous(limits = c(-0.5,0.5)))
print(ggplot(combined_data,aes(half_life,color = type)) + scale_x_continuous(limits = c(-0.5,0.5)) + stat_ecdf())
dev.off()

#trying to connect the alt_0 and the rest alt_n to the type of exon

#alt0
half_life_gtf_alt0_modified <- half_life_gtf_alt0
for(k in (1:nrow(half_life_gtf_alt0)))
{
  half_life_gtf_alt0_modified[k,]$gene_id <- (unlist(strsplit(unlist(strsplit(half_life_gtf_alt0[k,]$gene_id,";")),":"))[2])
}

#alt1,2,3,4,5
half_life_gtf_altn <- rbind(half_life_gtf_alt1,half_life_gtf_alt2,half_life_gtf[grep("alt_3",half_life_gtf$gene_id),],half_life_gtf[grep("alt_4",half_life_gtf$gene_id),],half_life_gtf[grep("alt_5",half_life_gtf$gene_id),])
half_life_gtf_altn <- half_life_gtf[grep("alt",half_life_gtf$gene_id),]

half_life_gtf_altn_modified <- half_life_gtf_altn
for(k in (1:nrow(half_life_gtf_altn)))
{
  half_life_gtf_altn_modified[k,]$gene_id <- (unlist(strsplit(unlist(strsplit(half_life_gtf_altn[k,]$gene_id,";")),":"))[2])
}

#dataframes
df_tutrs_alt0 <- c()
df_tutrs_altn <- c()
df_altexons_alt0 <- c()
df_altexons_altn <- c()

#looping through data of both alt_0 and alt_n for each case and checking if the gene is present as Tandem UTRs or Alt Exons
for(k in (1:nrow(half_life_gtf_alt0_modified)))
{
  print(k)
  gtf_gene_id <- (unlist(strsplit(unlist(strsplit(half_life_gtf_alt0[k,]$gene_id,";")),":"))[2])
  print(gtf_gene_id)
  if(gtf_gene_id %in% tandem_utrs_geneids)
  {
    newrow <- data.frame(half_life_gtf_alt0_modified[which(half_life_gtf_alt0_modified$gene_id == gtf_gene_id),])
    df_tutrs_alt0 <- rbind(df_tutrs_alt0,newrow)
  }
  if(gtf_gene_id %in% alt_exons_geneids)
  {
    newrow <- data.frame(half_life_gtf_alt0_modified[which(half_life_gtf_alt0_modified$gene_id == gtf_gene_id),])
    df_altexons_alt0 <- rbind(df_altexons_alt0,newrow)
  }
}

for(k in (1:nrow(half_life_gtf_altn_modified)))
{
  print(k)
  gtf_gene_id <- (unlist(strsplit(unlist(strsplit(half_life_gtf_altn[k,]$gene_id,";")),":"))[2])
  print(gtf_gene_id)
  if(gtf_gene_id %in% tandem_utrs_geneids)
  {
    newrow <- data.frame(half_life_gtf_altn_modified[which(half_life_gtf_altn_modified$gene_id == gtf_gene_id),])
    df_tutrs_altn <- rbind(df_tutrs_altn,newrow)
  }
  if(gtf_gene_id %in% alt_exons_geneids)
  {
    newrow <- data.frame(half_life_gtf_altn_modified[which(half_life_gtf_altn_modified$gene_id == gtf_gene_id),])
    df_altexons_altn <- rbind(df_altexons_altn,newrow)
  }
}

#assigning types
df_tutrs_alt0$type = "Tandem UTRs alt_0"
df_tutrs_altn$type = "Tandem UTRs alt_n"
df_altexons_alt0$type = "Alternative Exons alt_0"
df_altexons_altn$type = "Alternative Exons alt_n"
combined_data_alt0_altn = rbind(df_tutrs_alt0,df_tutrs_altn,df_altexons_alt0,df_altexons_altn)

#pplotting the data
pdf("tandem_vs_alt_half_lifes_seperate_for_alt0_and_altn_gtf.pdf")
print(ggplot(combined_data_alt0_altn,aes(half_life,fill = type)) + geom_histogram(binwidth = 0.01,alpha = 0.5) + scale_x_continuous(limits = c(-0.5,0.5)))
print(ggplot(combined_data_alt0_altn,aes(half_life,color = type)) + geom_density(alpha = 0.5) + scale_x_continuous(limits = c(-0.5,0.5)))
print(ggplot(combined_data_alt0_altn,aes(half_life,color = type)) + scale_x_continuous(limits = c(-0.5,0.5)) + stat_ecdf())
dev.off()