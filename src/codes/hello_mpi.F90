program hello

    use mpi
    implicit none
    
    integer :: rang, nproc, code, ierr
    call MPI_INIT(code)                             !---- Initialisation MPI
    call MPI_COMM_RANK(MPI_COMM_WORLD,rang,code)    !---- Numero du processus
    call MPI_COMM_SIZE(MPI_COMM_WORLD,nproc,code)   !---- Nombre total de processus 
    write(*,*) " rang, nproc", rang, nproc
    call MPI_FINALIZE(code)

end program hello

