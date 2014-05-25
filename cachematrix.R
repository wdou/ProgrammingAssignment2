## The functions are used to help store the inverse of a matrix into the cache so that it doesn't need to be computed ever time when using. 

## The first function, makeVector creates a special "vector", which is really a list containing a function to

#1. set the matrix
#2. get the matrix
#3. set the inverse of the matrix
#4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	m<- NULL 
	set<-function (y) {
		x<<- y
		m<<- NULL

}
get<- function()x
setinverse<- function(solve) m<<-solve
getinverse<- function() m
list(set = set, get = get,
	setinverse = setinverse,
	getinverse = getinverse)
}

## The following function calculates the inverse of a matrix. If the inverse already exists in the cache, it will get the invese from the cache. Otherwise, it will compute it and store it in the cache.


cacheSolve <- function(x, ...) {
	m<- x$getinverse()
	if(!is.null(m)){
		message("getting cached data")
		return(m)
}
	data<-x$get()
	m<-solve(data,...)
x$setinverse(m)
m
        ## Return a matrix that is the inverse of 'x'
}
