
Name:Suneesha Kudipudi

Environment:code modified to run on command line
packages used: Rpart and Rpart.plot

NOTE: If the packages Rpart and Rpart.plot are already installed comment the first two lines for the code to execute on the command line.

  Since the code is being run from the command line, the code can be run by the below code:

Rscript Assign2.R training_set1.csv validation_set2.csv test_set1.csv training_set2.csv validation_set2.csv test_set2.csv 

Explaination of the code:
   1.Combined the training set and validation set for better tree

   2.Used rpart to construct the tree with the spliting done on the basis of information gain.

   3.Examined variable importance

   4.Plotted using rpart.plot

   5.Summary of the tree is given

   6.Pruned the tree based on the complexity parameter.

   7.Predicted the accuracy on the test data set from the contingency table. The sum of diagonal values divided by the sum of all the elements in the table gives the accuracy.

Contingency table for Dataset 1:

#predicted
#    0   1
# 0 693 307
# 1 255 745
#Accuracy of the decision tree= (693+745)/2000=71.9%


Contingency table for Dataset 2:

#predicted
#   0   1
#0 189 111
#1  33 267
#Accuracy of the decision tree= (189+267)/600=76%

 The sum of the diagonal values gives the number of correctly predicted record. 
