##This script is for plotting the read length cuttoff vs. coverage for raw reads. You can derive the read length with an awk script: 
##
## awk 'NR % 4 == 2 {print length($0)}' my.fastq > read_lenght.txt


plot_coverage<-function(read,genome_size,step){
    
    reads=read.table(read,header=F)
    max_it=floor(max(reads)/step)

    mat=matrix(data = 0, nrow = max_it, ncol = 2)
    for(i in c(0:max_it)){
        mat[i,1]=i
        mat[i,2]=sum(reads[reads>(i*step)])/genome_size
    }

  rownames(mat)=mat[,1]

 barplot(mat[,2],col='blue', xlab="Min read length (1 kbp)",main="Read length vs. coverage",ylab="Coverage")
}




genome_size=3234830000
plot_coverage('read_length.txt',genome_size,1000)
