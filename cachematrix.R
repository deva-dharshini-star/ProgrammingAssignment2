## Caching the inverse of matrix
## makeCacheMatrix is used to get the inverse of the matrix

## Library (MASS) is used here to calculate the inverse of squared and non-squared matrices

library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  inv<- NULL
  set<- function(y) {
    x<<-y
    inv<<-NULL
  }
get<- function()x
setinv<-function(inverse)  inv<<-inverse
getinv<- function(){
  inver<- ginv(x)
  inver%*%x
}
list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## cacheSolve is used to get the cache data

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<-x$getinv()
  if(!is.null(inv)){
    message("cached data")
    return(inv)
  }
  data<-x$get()
  inv<-solve(data, ...)
  x$setinv(inv)
  inv
}
