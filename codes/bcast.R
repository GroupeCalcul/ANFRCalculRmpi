library(Rmpi)

id <- mpi.comm.rank(comm=0)

# Diffusion du vecteur v sur les processeurs autre que 0
if (id == 0) {
	v <- c(1, 2, 3, 4)
    mpi.bcast.Robj(obj = v, rank = 0, comm = 0)
} else {
    v <- mpi.bcast.Robj(rank = 0, comm = 0)
}

cat("vector on ", id, " = ",  v, "\n" )

invisible(mpi.barrier(comm=0))
invisible(mpi.finalize())
