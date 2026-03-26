v11 = 1:10
v11

v12 = seq(from = 1, to = 10, by = 1)
v12

v22 = 2 + 5*(0:2)
v22 = seq(from = 2)

v22 = seq(from = 2, to = 12, by = 5)


#######
mymat <- matrix(0,4,2)
mymat
mymat[2,] <- c(3,6)
mymat

#######
x <- seq(-pi, pi, length.out = 20)
y <- sin(x)
x
y


mat <- matrix(sample(-5:5, 24, replace = TRUE),nrow = 4, ncol = 6)
mat
mat_pos <- abs(mat)
mat_pos


########
