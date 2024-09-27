suppressMessages(library(pbdMPI, quietly = TRUE))

size <- comm.size()
rank <- comm.rank()

x <- numeric(5)

if (rank == 0) {
    x <- c(1:5) 
}
comm.print(x, all.rank = TRUE)

x <- bcast(matrix(x, nrow = 1))

barrier()

comm.print(x, all.rank = TRUE)

finalize()

