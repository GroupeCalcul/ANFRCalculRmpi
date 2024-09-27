suppressMessages(library(pbdMPI, quietly = TRUE))

.comm.size <- comm.size()
.comm.rank <- comm.rank()

N <- 5
x.total <- (.comm.size + 1) * .comm.size / 2
x <- 1:x.total
x.count <- 1:.comm.size
comm.cat("Original x:\n", quiet = TRUE)
comm.print(x)

y <- scatter(split(x, rep(x.count, x.count)))   
comm.cat("\nScatter list:\n", quiet = TRUE)
comm.print(y, all.rank = TRUE)

finalize()
