## The 2 functions are to create a list to store the matrix and cache the methods and to compute the inverse of the matrix by using the store function in R

makeCacheMatrix <- function(x = matrix()) {
inv <<- NULL  ## initialise the inversion matrix as null object first
  
  set <- function(y) {
    x<<-y
    inv<<-NULL
  }  
  get <- function() x  
  
  setInversion <- function(inverse){
    inv <<- inverse  
  }
  
  getInversion <- function() inv
  
  ## list object that allow the calling function to reference the above functions 
  list(set=set,get=get,
       setInversion=setInversion,
       getInversion=getInversion)
 
}


## to get the matrix object and compute the inversion of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInversion()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data<-x$get() ## this is to get the value of matrix
  print("solving the data...")
  print(data)
  i<-solve(data,...) ## computing the inverse of the matrix using the solve function in R
  x$setInversion(i)
  i
        
}
