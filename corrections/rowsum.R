library(Rmpi)

loop.fun <- function(){
  m.dim <- list(nrow = 200000, ncol = 10)
  m <- matrix(1, nrow = m.dim$nrow, ncol = m.dim$ncol)
  ret <- sum(rowSums(m))
}

my.rank <- mpi.comm.rank(comm=0)
my.size <- mpi.comm.size(comm=0)

my.loop <- 20 
my.split <- .splitIndices(my.loop, my.size)

my.loop <- unlist(my.split[my.rank+1])

ret <- 0
for(i in my.loop){
    ret <- ret + loop.fun()
}

res <- mpi.reduce(as.integer(ret), type = 1, op = "sum", dest = 0, comm = 0)
 
if (my.rank == 0 ) { cat("\n", res, "\n") }

invisible(mpi.barrier(comm=0))
invisible(mpi.finalize())
