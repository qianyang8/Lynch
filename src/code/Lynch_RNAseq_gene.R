ggplot(mds_add, aes(x = `1`, y = `2`, color=tissue, shape = `hypermutated?`)) + 
  geom_point(size = 3) + 
  scale_fill_discrete(breaks=c('Yes', 'No', 'TBC')) +
  scale_shape_manual(values = c(4, 1, 19)) +
  coord_fixed() + 
  ggtitle("MDS with VST data") + 
  theme(legend.position = 'bottom')
