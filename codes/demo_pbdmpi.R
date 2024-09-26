suppressMessages(library(pbdMPI, quietly = TRUE))
init()

.comm.size <- comm.size()
.comm.rank <- comm.rank()

### Examples.
x <- matrix(1:5, nrow = 1)
y <- bcast(x)
comm.print(x)
comm.print(y)

k <- 10
x <- rep(.comm.rank, k)
comm.cat("\nOriginal x vector:\n", quiet = TRUE)
comm.print(x, all.rank = TRUE)

y <- allgather(x, unlist = TRUE)
A <- matrix(y, nrow = k, byrow = FALSE)
comm.cat("\nAllgather matrix (only showing process 0):\n", quiet = TRUE)
comm.print(A)

### Finish.
finalize()

