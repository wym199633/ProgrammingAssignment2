## the "inverse" is to cache the inverse of matrix x
## the function "set" is to set the matrix x and reset "inverse" to NULL
## the function "get" is to return the matrix x
## the function "setinverse" is to set the "inverse" directly
## the function "getinverse" is to return the "inverse"



makeCacheMatrix <- function(x = matrix()) {
  inverse<-NULL
  set<-function(y){
    x<<-y
    inverse<<-NULL
  }
  get<-function() x
  setinverse<-function(newinverse) inverse<-newinverse
  getinverse<-function() inverse
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## just the same as the example

cacheSolve <- function(x, ...) {
        inverse<-x$getinverse()
        if(!is.null(inverse)){
          message("getting cached data")
          return(inverse)
        }
        data<-x$get()
        inverse<-solve(data,...)
        x$setinverse()
        inverse
}
