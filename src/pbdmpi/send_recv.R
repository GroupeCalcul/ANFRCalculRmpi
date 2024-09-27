suppressMessages(library(pbdMPI, quietly = TRUE))

init()

size <- comm.size()
rank <- comm.rank()

if (rank == 0) {
	for (i in seq(1, size-1)) {
		recv <- recv(x = integer(1), rank.source = i)
		cat("Process 0: Received from process", i, "saying:", recv, "\n")
	}
} else {
	msg <- rank
	cat("Process", rank, " sent to process 0:", msg, "\n")
    send(msg, rank.dest = 0)
}

finalize()

