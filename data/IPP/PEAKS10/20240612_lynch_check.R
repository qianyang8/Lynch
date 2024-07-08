library(dplyr)

precover1 = read.csv("./Lynch/CRC-Gel-First-Round_PEAKS_37_20230628/CRC-Gel-First-Round_PEAKS_37_20230628_DBsearchpsm.csv")
precover2 = read.csv("./Lynch/CRC-GEL-Batch2_PEAKS_123/DB search psm.csv")
sprintf("There are %s in total peptides from %s patients in batch 2. On average, there are %s peptides recovered from each patient",
        dim(precover2)[1], length(unique(precover2$Source.File))/2, dim(precover2)[1]/length(unique(precover2$Source.File))*2)

precover2_MHCI <- precover2 %>% filter(Length >7, Length < 15)
sprintf("There are %s MHCI peptides from %s patients in batch 2. On average, there are %s peptides recovered from each patient",
        dim(precover2_MHCI)[1], length(unique(precover2_MHCI$Source.File))/2, dim(precover2_MHCI)[1]/length(unique(precover2_MHCI$Source.File))*2)
