## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a cached version of the matric storing the original data and the inverse.
## The inverse is computed lazily and so the set function sets the inverse to null.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This function computes the inverse of the matri

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
          
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  inverse
  
}
