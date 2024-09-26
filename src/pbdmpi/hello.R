# load the package and initialize MPI
suppressMessages(library(pbdMPI, quietly = TRUE))

# Hello world
message <- paste("Hello from rank", comm.rank(), "of", comm.size())
comm.print(message, all.rank = TRUE, quiet = TRUE)

# shut down the communicators and exit
finalize()
