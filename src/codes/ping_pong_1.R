

library(Rmpi)
nb_valeurs <- 1000
etiquette <- 99

valeurs <- runif(nb_valeurs)

id <- mpi.comm.rank(comm = 0)
np <- mpi.comm.size(comm = 0)

if (id == 0) {
  ## envoi du message
  ## ...

} else {
  buffer <- numeric(nb_valeurs)

  ## reception du message
  ## ...

  cat("Moi, processus 1, j''ai recu ",
      nb_valeurs,
      " valeurs du processus 0. \n")
  cat("Premiere valeur ", recv[1], " derniere valeur ", recv[1000], " \n")
}

invisible(mpi.barrier(comm = 0))
invisible(mpi.finalize())
