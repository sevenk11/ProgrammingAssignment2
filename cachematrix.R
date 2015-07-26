## Store functions in a list to be used within the main function


## Creates a function that will create and store a square matrix
## using functions created and stored inside the function as a list
## that can be used in a later function to get the inverse of the matrix
## Usage:
## mat <- matrix(rnorm(9),3,3)
## m <- makeCacheMatrix(mat)

makeCacheMatrix <- function(x = matrix()) {
## Reintialize i
    i <- NULL
## Set original values or set new if program doesn't require cached data
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
## Get the variable x to be used in main function
    get <- function() x
## Cache the solved calculation
    setinv <- function(solve) i <<- solve
## Get the solved calculation
    getinv <- function() i
## Generate list containing functions
    list(set=set,get=get,
         setinv=setinv,
         getinv=getinv)
}


## Calculates the inverse of the matrix or returns the cached inverse
## Usage: cacheSolve(m)
cacheSolve <- function(x, ...) {
## Get solved calcuation and store in i
    i <- x$getinv()
## if new calculation not required display message and return
    if(!is.null(i)){
        message("Returning cached inverse")
        return(i)
    }
## retrieve matrix stored with makeCacheMatrix, calculate its inverse
## and stores it in the variable created in makeCacheMatrix
    data <- x$get()
    i <- solve(data,...)
    x$setinv(i)
    i
}
