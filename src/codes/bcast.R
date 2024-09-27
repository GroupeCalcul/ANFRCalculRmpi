library(Rmpi)

id <- mpi.comm.rank(comm=0)

v <- numeric(4)

if (id == 0) { for (i in 1:4) v[i] <- i }

# Diffusion du vecteur v sur les processeurs autre que 0
v <- mpi.bcast(v, type = 2, rank = 0, comm = 0)


cat("vector on ", id, " = ",  v, "\n" )

invisible(mpi.barrier(comm=0))
invisible(mpi.finalize())
