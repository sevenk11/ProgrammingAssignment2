## Store functions in a list to be used within the main function


## Creates a function that will create and store a square matrix
## that can be used in a later function to get the inverse of the matrix
## Usage:
## mat <- matrix(rnorm(9),3,3)
## m <- makeCacheMatrix(mat)

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set=set,get=get,
         setinv=setinv,
         getinv=getinv)
}


## Calculates the inverse of the matrix or returns the cached inverse
## Usage: cacheSolve(m)
cacheSolve <- function(x, ...) {
    i <- x$getinv()
    if(!is.null(i)){
        message("Returning cached inverse")
        return(i)
    }
    data <- x$get()
    i <- solve(data,...)
    x$setinv(i)
    i
}
