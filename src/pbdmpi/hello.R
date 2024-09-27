suppressMessages(library(pbdMPI, quietly = TRUE))

message <- paste("Hello from rank", comm.rank(), "of", comm.size())
comm.print(message, all.rank = TRUE, quiet = TRUE)

finalize()
