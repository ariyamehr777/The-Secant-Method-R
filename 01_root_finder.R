#01_root_finder

Root <- function(f,a,epsilon) {
  
  x.current <- a
    
    while (abs(f(x.current))>epsilon) {
      
      if (f(x.current+f(x.current))==f(x.current) ) 
        stop("Locally Constant")
      
      
      x.current <- x.current - ((f(x.current)*f(x.current))/(f(x.current+f(x.current))-f(x.current)))
      
    }
  
  return(x.current) 
  
}


