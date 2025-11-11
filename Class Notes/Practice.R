y <- c(0, 2, 5, 8, 15)
X <- matrix(
  c(1,2,3,
    1,1,4,
    1,3,7,
    1,6,5,
    1,5,2),
  byrow=TRUE, nrow=5, ncol=3
)
t(X)%*%X
b <- solve(t(X)%*%X)%*%t(X)%*%y
C <- matrix(c(0,1,-1), byrow=TRUE,nrow=1,ncol=3)
C%*%b
solve(C%*%solve(t(X)%*%X)%*%t(C))
3.01*3.01*8.15

mat <- matrix(
  c(3, 3,
    2, 11,
    1, 4,
    5, 2,
    4, 5),
  byrow=TRUE, nrow=5, ncol=2
)
mat

scale(mat)

XYdata <- matrix(cbind(y, X[,-1]), ncol=3)
XYdata



#Neural Network Practice

WeightsX <- c(-1, 1)
WeightsY <- c(0, 1)
WeightsF <- c(0.5, -0.5)

input <- c(3, 4)

input %*% rbind(WeightsX, WeightsY) %*% WeightsF
