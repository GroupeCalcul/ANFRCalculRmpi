suppressMessages(library(pbdMPI, quietly = TRUE))
.comm.size <- comm.size()
.comm.rank <- comm.rank()

N <- 5
x <- (1:N) + N * .comm.rank
comm.cat("Original x:\n", quiet = TRUE)
comm.print(x, all.rank = TRUE)

y <- reduce(matrix(x, nrow = 1), op = "sum")
comm.cat("\nReduce sum:\n", quiet = TRUE)
comm.print(y)

finalize()
