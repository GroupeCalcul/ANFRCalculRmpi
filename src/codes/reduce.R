library(Rmpi)

id <- mpi.comm.rank(comm=0)
np <- mpi.comm.size(comm=0)

if (id == 0) {
    data = matrix(1:24,ncol=3)
    splitmatrix = function(x, ncl) lapply(.splitIndices(nrow(x), ncl), function(i) x[i,])
    chunk = splitmatrix(data, np)
}

chunk <- mpi.scatter.Robj(obj = chunk, root = 0, comm = 0)

cat("data on ", id, ":", chunk, "\n")

res <- mpi.reduce(chunk, type=1, op="sum", dest = 0, comm = 0) 

if ( id == 0 ) {
	cat("\n", res, "\n")
}

invisible(mpi.barrier(comm=0))
invisible(mpi.finalize())
