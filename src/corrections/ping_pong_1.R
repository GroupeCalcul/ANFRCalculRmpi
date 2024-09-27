library(Rmpi)
nb_valeurs <- 1000
etiquette <- 99

valeurs <- runif(nb_valeurs)

id <- mpi.comm.rank(comm = 0)
np <- mpi.comm.size(comm = 0)

if (id == 0) {
	err <- mpi.send(valeurs, type = 2, dest = 1, tag = etiquette, comm = 0)
} else {
	recv <- mpi.recv(numeric(nb_valeurs), type = 2, source = 0, tag = etiquette, comm = 0)
    cat("Moi, processus 1, j''ai recu ",nb_valeurs," valeurs du processus 0. \n")
    cat("Premiere valeur ",recv[1]," derniere valeur ", recv[1000], " \n")
}

invisible(mpi.barrier(comm = 0))
invisible(mpi.finalize())
