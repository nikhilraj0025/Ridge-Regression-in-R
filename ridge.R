library(car)

BODYFAT<-read.csv("C:/Users/AKHIL/Desktop/New folder/bodyfat.csv")
model1<-lm(Bodyfat~.,data=BODYFAT)
model1
summary(model1)
vif(model1)

BFT<-scale(BODYFAT)
BFT<-as.data.frame(BFT)
lm_seq<-seq(0,10,.01)
lm_seq


model2<-lm.ridge(Bodyfat~.,data=BFT,lambda = lm_seq)
model2
plot(model2)
summary(model2)
plot(model2$lambda,model2$GCV)
str(model2)


model2$lambda[which(model2$GCV==min(model2$GCV))]
model3<-lm.ridge(Bodyfat~.,data=BFT,lambda = .73)
model3
