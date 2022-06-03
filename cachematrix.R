## To avoid recalculation, we write functions to cache the inverse matrix of 
## x.  We further design that the inverse of x will only be 
## recalculated if the input has been changed. Otherwise it will return the 
## the cached inverse matrix

## We create a matrix that stores the cached inverse matrix and 
## returns a list containing functions to set and get the cached inverse matrix
## for further use.

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<-function()x
  setinverse<-function(inverse) i<<-inverse
  getinverse<-function() i
  list(set=set, get=get, setinverse=setinverse,getinverse=getinverse)
}


## If a new matrix is input into the function, since its inverse matrix does   
## not exists (as defaulted NULL in makeCacheMatrix),the inverse matrix will  
## be recalculated. Otherwise it will just return the cached inverse matrix. 

cacheSolve <- function(x, ...) {
  i<-x$getinverse()
  if(!is.null(i)){
    message("getting cahced data")
    return(i)
  }
  data<-x$get
  i<-sovle(data)
  x$setinverse(i)
  i
  
  ## Return a matrix that is the inverse of 'x'
}
