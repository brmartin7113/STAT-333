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
