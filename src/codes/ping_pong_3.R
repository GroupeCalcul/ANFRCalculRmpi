

library(Rmpi)

nb_valeurs_max <- 7000000
nb_tests <- 9
etiquette <- 99

nb_valeurs <- as.integer(c(0, 1, 10, 100, 1000, 10000, 100000, 1000000, 7000000))

valeurs <- runif(nb_valeurs_max)

id <- mpi.comm.rank(comm = 0)
np <- mpi.comm.size(comm = 0)


for (i in 1:nb_tests) {
  if (id == 0) {
    # Envoi et reception de nb_valeurs[i] valeurs
    # ...

    cat("Moi, processus 0, j''ai envoye et recu ",
        nb_valeurs[i],
        " du processus 1 \n")
  }
  else if (id == 1) {
    # Reception et envoi de nb_valeurs[i] valeurs
    # ...

  }
}


invisible(mpi.barrier(comm = 0))
invisible(mpi.finalize())
