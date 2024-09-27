library(Rmpi)

id <- mpi.comm.rank(comm = 0)
np <- mpi.comm.size(comm = 0)

if (id == 0) {
	for (i in seq(1, np-1)) {
		recv <- mpi.recv(x = integer(1), type = 1, source = i, tag = 0, comm = 0)
		cat("Process 0: Received from process", i, "saying:", recv, "\n")
	}
} else {
	msg <- as.integer(id)
	cat("Process", id, " sent to process 0:", msg, "\n")
	invisible(mpi.send(msg, 1, dest = 0, tag = 0, comm = 0))
}

invisible(mpi.barrier(comm = 0))
invisible(mpi.finalize())
