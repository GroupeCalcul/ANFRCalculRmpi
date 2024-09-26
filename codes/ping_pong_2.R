

library(Rmpi)

nb_valeurs <- 100000
etiquette <- 99

valeurs <- runif(nb_valeurs)

id <- mpi.comm.rank(comm = 0)
np <- mpi.comm.size(comm = 0)

if (id == 0) {
  ## envoi du message
  ## ...

  cat("Moi, processus 0, j''ai envoye et recu ", nb_valeurs, "\n")
  cat("valeurs (derniere = ", recv[nb_valeurs], ") du processus 1")

} else {
  buffer <- numeric(nb_valeurs)

  ## reception du message
  ## ...
}


invisible(mpi.barrier(comm = 0))
invisible(mpi.finalize())
