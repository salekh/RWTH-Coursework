## Create suitable data for teaching materials

# read original data from file
tdata<-read.table("datasets/htdata.txt") 

# organize data and give it names
ntdata<-data.frame(id=V1,dead=as.factor(V14), prsur=as.factor(V15),mismatch=V16,HLAA2=V17,misscore=V18,reject=as.factor(V19) )

# create bund variables for DoA and DoT
ntdata$DoA<-as.array(cbind(V5,V6,V7)); ntdata$DoT<-as.array(cbind(V8,V9,V10))

# show the names of ntdata
names(ntdata)

# write data as preproc.data into a file
write.table(ntdata,row.names=FALSE,file="datasets/preproc.data",sep="\t")

# read data from preproc.data 
tdata<-read.table("datasets/preproc.data",head=TRUE)
names(tdata)
tdata$dead<-as.factor(tdata$dead)
tdata$prsur<-as.factor(tdata$prsur)

# 06.12 create sample from data by using sample
# using function sample() to samplify index of data sets at first
tinx<- sample(nrow(tdata),0.7*nrow(tdata),replace=FALSE)
# through the index we get the sample data
traindata<-tdata[tinx,]  
# the left data will be the test data
testdata<-tdata[-tinx,] 
# show the number of data in each data sets 
nrow(tdata) # original data 
nrow(traindata) # training data
nrow(testdata) # test data

# create pie box
attach(tdata)
tb<- table(dead,prsur)
labels<-c("NoPrSur_NoDead","NpPrSur_Dead","PrSur_NoDead","PrSur_Dead")
pie(tb,labels=labels)

# create boxplot 
boxplot(misscore~prsur,data=tdata,xlab="prior surgery", ylab="misscore")

# data normalization
(misscore - min(misscore))/(max(misscore)- min(misscore))

# data standardization
(misscore - mean(misscore) )/sd(misscore)



