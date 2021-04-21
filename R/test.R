percept<-function(data=data,eta=eta){
  x<-data[,-dim(data)[2]]
  y<-data[,dim(data)[2]]
  w<-c(0,0)
  b=0
  len=length(y)
  i=1
  while(i<=len){
    if(y[i]*(x[i,]%*%w+b)<=0){
      w=w+eta*y[i]*x[i,]
      b=b+eta*y[i]
      i=1
    }
    else{
      i=i+1
    }
  }
  return(list(w=w,b=b))
}

data=matrix(c(1,1,-1,.5,.5,-1,4,1,1,3,2,1,1.5,1,-1,2,3,1,4,3,1,2,3.5,1),nc=3,byrow=T)
percept(data=data,eta=1)

dat1 <- data[,1:2]
dat1 <- as.data.frame(dat1)
names(dat1) <- c("x1","x2")
plot(x2~x1,data=dat1,col=ifelse(4*x1-7<=0,"red","blue"),pch=17,bty="l")
abline(v=7/4,lwd=2,lty=2,col="red")
