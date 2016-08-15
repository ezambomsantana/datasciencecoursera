# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(m = matrix()) {
  inv <- NULL
  set <- function(y) {
    m <<- y
    inv <<- NULL
  }
  get <- function() m
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


# The cacheSOlve function calculate the inverse of the matrix. It first checks the 
# cache to veify if the inverse has already been computed. If so, it gets the 
# result and skips the computation. If not, it computes the inverse with the solve function,
# sets the value in the cache via setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x) {
  if(!is.null(x$getInverse())) {
    return(x$getInverse())
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv
}

# Sample:
x = rbind(c(1, -1/4), c(-1/4, 1))
m = makeCacheMatrix(x)
m$get()

# No cache in the first run
cacheSolve(m)

# Using the cache

cacheSolve(m)
