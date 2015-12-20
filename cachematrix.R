
## This R file is used to store and get a matrix and its inverse
## matrix into/from cache. To use it, you need to:

## 1. source it to R environment,

## run the first function makeCacheMatrix(), and assign it to a matrix, say
## 2. tmp<-makeCacheMatrix(matrix(1:4,2,2))

## Now you have the tmp matrix, you can get its inverse matrix by
## calling the cacheSolve() function.
## 3. cacheSolve(tmp)


## This first function makeCacheMatrix is a list of four functions
## to set, get the original matrix and its inverse matrix, it does
## the work of read and write only. It doesn't do any matrix calculation.
makeCacheMatrix<-function(x=matrix()){
    inv<-NULL
    set<-function(y){
        x<<-y
        inv<<-NULL
    }
    
    get<-function() x
    
    setInverse<-function(inverse){
        inv<<-inverse
    }
    
    getInverse<-function() inv
    
    list(set = set, get = get,
    setInverse = setInverse,
    getInverse = getInverse)
}


## This second function reads the inverse matrix. In case it doesn't
## already exist, it will calculate the inverse matrix, store it
## into cache and return it.
cacheSolve<-function(x=matrix(),...){
    inv<-x$getInverse()
    if(!is.null(inv)){
        message("getting cache data")
        return(m)
    }
    
    data<-x$get()
    inv<-solve(data,...)
    x$setInverse(inv)
    inv
}