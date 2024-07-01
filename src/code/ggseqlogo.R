install.packages("ggseqlogo")

require(ggplot2)
require(ggseqlogo)
require(stringi)
require(dplyr)

CRCbatch2_PEAKS127 <- read_csv("CRC-GEL-Batch2_PEAKS_127_20230628_DBsearchpsm.csv")
CRCbatch2_PEAKS127_HLA1 <- CRCbatch2_PEAKS127 %>% dplyr::filter( Length < 15 )
plot(table(CRCbatch2_PEAKS127_HLA1$Length))

peptides8 <- list(subset(CRCbatch2_PEAKS127_HLA1, Length==8)$Peptide)
peptides9 <- list(subset(CRCbatch2_PEAKS127_HLA1, Length==9)$Peptide)

# remove all (...)
peptides8_mod <- rapply(peptides8, str_replace, pattern="\\s*\\([^\\)]+\\)", replacement="", how='replace')
peptides9_mod <- rapply(peptides9, str_replace, pattern="\\s*\\([^\\)]+\\)", replacement="", how='replace') # this will only replace the first instance
# still have (+15.99) remained in the sequence
# use gsub instead, will replace globally
peptides9_mod <- rapply(peptides9, gsub, pattern="\\(\\+[0-9]{0,3}\\.[0-9]{2}\\)", replacement="", how='replace')
peptides8_mod <- rapply(peptides8, gsub, pattern="\\(\\+[0-9]{0,3}\\.[0-9]{2}\\)", replacement="", how='replace')
# check the length of each element after modification
rapply(peptides9_mod, function(x) nchar(x))
table(rapply(peptides9_mod, function(x) nchar(x)))

# which are not equal to 9
peptides9_mod[[1]][rapply(peptides9_mod, function(x) nchar(x)) != 9]

# generate a list
peptides <- list("peptide8"=peptides8_mod, "peptide9"=peptides9_mod)
# unlist
peptides$peptide8 <- unlist(peptides$peptide8)
peptides$peptide9 <- unlist(peptides$peptide9)
# then can plot multiple seq logos
ggseqlogo(peptides)
