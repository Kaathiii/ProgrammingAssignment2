## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


library()

makeCacheMatrix <- function(m=matrix() ) {
  #Create a matrix object which can cache its inverse
  
  i<-NULL
  #the initial property is initialised
  
  set<-function( matrix ) {
    #set the matrix
    
    m <<- matrix
    i<<- NULL 
  }
  
  get<-function() {
    #Get the matrix
    m
    #Return the matrix
  }
  setInverse<-function(inverse) {
    #Method to get the inverse of the matrix
    
    i<<- inverse
    #Return the inverse property
    
  }
  getInverse<-function() {
    i
  }
  
  list(set=set, get=get,
       setInverse=setInverse,
       getInverse=getInverse)
  #Return a list of the methods
}

cacheSolve<-function(x,...) {
  #Now we compute the matrixes inverse returned by "MakeCacheMatrix"
  #If the inverse has already been calculated then the cachesolve function shall retrieve the inverse from the cache.
  m<-x$getInverse()
  #Return the inverse matrix of x
  
  if(!is.null(m) ) {
    message("Getting cached data") 
    return(m)
  }
  #If the inverse is already set just return it
  
  data<-x$get()
  #Get the matrix from out object
  
  m<-solve(data)%*% data
  #Calculate the inverse by using matrix multiplication
  
  x$setInverse(m)
  #Set the inverse to the object
  
  m
  #Return the matrix
}

M<-matrix(1:4,nrow=2,ncol=2)
#Create a matrix 

M1<-makeCacheMatrix(M)
cacheSolve(M1)

cacheSolve(M1)