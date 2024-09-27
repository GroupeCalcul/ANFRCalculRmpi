library(pbdMPI)

loop.fun <- function(){
  m.dim <- list(nrow = 200000, ncol = 10)
  m <- matrix(1, nrow = m.dim$nrow, ncol = m.dim$ncol)
  ret <- sum(rowSums(m))
}

splitIndices <- function(x, rank, size){
    chunks <- split(x, cut(seq_along(x), size, labels = FALSE))
	return(as.vector(unlist(chunks[rank+1])))
}

my.rank <- comm.rank()
my.size <- comm.size()

my.loop <- 1:20 
my.loop <- splitIndices(my.loop, my.rank, my.size)
comm.print(my.loop, all.rank = TRUE)

ret <- 0
for(i in my.loop){
    ret <- ret + loop.fun()
}

res <- reduce(as.integer(ret), "sum", rank.dest = 0)
 
comm.cat("\n res = ", res, "\n")

barrier()
finalize()
