input_file = 'networks_test/exp_matrix.txt'
out_dir = 'networks_test/'


library(minet)
rpkm_data <- read.delim(input_file,row.names = 1,check.names = F)
mi <- build.mim(t(rpkm_data))

n1 <- aracne(mi)
write.csv(n1,paste0(out_dir,'aracne_network.csv'))
n2 <- clr(mi)
write.csv(n2,paste0(out_dir,'clr_network.csv'))
n3 <- minet(mi)
write.csv(n3,paste0(out_dir,'minet_network.csv'))
n4 <- mrnet(mi)
write.csv(n4,paste0(out_dir,'mrnet_network.csv'))

