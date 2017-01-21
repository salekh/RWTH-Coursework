## About the R operations
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
"qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
"sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
"sa", "act", "nsw", "vic", "vic", "act")
state
statef<-factor(state) # create a factor using factor()
attributes(statef) # list attributes of statef


incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
59, 46, 58, 43)
incomes
account<- data.frame(home=state,income=incomes)
attach(account)
statef<-factor(state) 
incmeans<- tapply(incomes,statef,mean) 
incmeans
detach(account)

x<-1
y<-3
if(x>y)
 print("x is bigger than y")
else
 print("x is not bigger than y")

for(i in 1:3){
 for(j in 1:3){
  if(j==2){
    print("jump to the next execution...")
    next;
  }else{ 
    if(i==2 && j==3)
      print("Only innerest loop will stop!")
  }
  cat(i,":",j,"\t")
 }
 cat('\n')
}
### function 
twosam <- function(y1, y2) {
 n1 <- length(y1); n2 <- length(y2)
 yb1 <- mean(y1); yb2 <- mean(y2)
 s1 <- var(y1); s2 <- var(y2)
 s <- ((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2)
 tst <- (yb1 - yb2)/sqrt(s*(1/n1 + 1/n2))
 tst # return vlaues
}

tstat<- twosam(x,y) ; tstat