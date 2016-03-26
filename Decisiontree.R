install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot) # used for plotting the tree

#Dataset 1
#for command line arguments 
args <- commandArgs(TRUE) 
training_set1 <- read.csv(file=args[1],header = TRUE, sep = ",") 

validation_set1 <- read.csv(file=args[2],header = TRUE, sep = ",") 

test_set1 <- read.csv(file=args[3],header = TRUE, sep = ",") 


#Combining the training set along with the validation set for better tree construction
new_set1 <- rbind(training_set1,validation_set1)
str(new_set1)
#constructing the tree f
f<-rpart(Class~.,data=new_set1,method="class",parms = list(split = 'information'), minsplit = 2,minbucket = 1)
f$variable.importance 
#  XO          XF          XI          XQ          XG          XK          XS          XU 
#120.9220133 100.7822714  39.6972141  35.3087485  30.1738731  25.5300928  23.7157819  23.6480783 
#XD          XM          XB          XP          XC 
#19.1889941  19.1179863   8.3878863   0.2835584   0.1890389 
rpart.plot(f)
printcp(f) #selecting complexity parameter with the least Xerror Cp=0.01
FF<-prune(f,cp=0.01) #pruned tree
rpart.plot(FF)
summary(FF)
p3<-predict(FF,test_set1,type=c("class")) #predicted values
table(test_set1[,21],predicted=p3) 
#This compares the actual values and the predicted values. The sum of the diagonal values gives the number of correctly predicted record. 
#predicted
#    0   1
# 0 693 307
# 1 255 745
#Accuracy of the decision tree= (693+745)/2000=71.9%
#--------------------------------------------------------------------------------------------------------------------------------

#Dataset 2

#path to the data set 2
training_set2 <- read.csv(file=args[4],header = TRUE, sep = ",") 

validation_set2 <- read.csv(file=args[5],header = TRUE, sep = ",") 

test_set2 <- read.csv(file=args[6],header = TRUE, sep = ",") 

#Combining the training set along with the validation set for better tree construction
new_set2 <- rbind(training_set2,validation_set2)
g<-rpart(Class~.,data=new_set2,method="class",parms = list(split = 'information'), minsplit = 2,minbucket = 1)
g$variable.importance
#XO         XG         XK         XS         XF         XU         XI         XB         XQ 
#65.5124599 51.0355218 45.9492983 35.4872643 31.3936555 18.8458837 17.5210704 16.6047933 16.4590267 
#XC         XD         XJ         XM         XR 
#13.5357182 13.2410484  6.2810757  0.8823561  0.5462415 
rpart.plot(g)
printcp(g) #selecting cp with the least Xerror Cp=0.01
G<-prune(g,cp=0.01)
rpart.plot(G)
summary(G)
q3<-predict(G,test_set2,type=c("class"))
table(test_set2[,21],predicted=q3)
#This compares the actual values and the predicted values. The sum of the diagonal values gives the number of correctly predicted record. 
#predicted
#   0   1
#0 189 111
#1  33 267
#Accuracy of the decision tree= (189+267)/600=76%
