function boolean = checksim (matrix)
    if matrix - matrix'
        boolean = 0
    else
        boolean = 1
    end