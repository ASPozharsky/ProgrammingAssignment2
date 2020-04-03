## Caching/retrieving inverted matrix

## Create "matrix" object similaraly to cachemean()
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                invert <<- NULL
        }
        get <- function() x
        set.inv <- function(invert) inv <<- invert
        get.inv <- function() inv
        list(set=set, get=get, set.inv=set.inv, get.inv=get.inv)
}

## Compute inverted matrix and write/retrieve it in cache

cacheSolve <- function(x, ...) {
        inv <- x$get.inv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        inv <- solve(x$get())
        x$set.inv(inv)
        inv
}
