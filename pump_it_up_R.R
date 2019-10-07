library(caret)
library(list)
library(dummies)
X<-read.csv('/Users/603766/Desktop/brown_bag/data/702ddfc5-68cd-4d1d-a0de-f5f566f76d91.csv')
y<-read.csv('/Users/603766/Desktop/brown_bag/data/0bf8bc6e-30d0-4c50-956a-603fc693d966.csv')
class(X$id)
c<-colnames(X)
f<-c(1:length(c))
cat<-c()
num<-c()
op<-c()
for( i in 1:length(c)){
  g=c[i]
  f=class(X[,i])
  if(f=='factor'){
    cat<-append(cat,g,after=length(cat))
  }else{
    num<-append(num,g,after=length(num))
  }
  op<-append(op,g,after=length(op))
}
cat
cats_df<-X[,cat]
for(i in 1:length(cat)){
  if(length(unique(cats_df[,i]))>50){
    cats_df<-cats_df[,-i]
  }
}

for(i in 1:25){
  if(length(unique(cats_df[,i]))>50){
    altered_cats_df<-cats_df[,-i]
  }
}
ds<-dummy.data.frame(altered_cats_df)
full<-c(X[,num],ds)
