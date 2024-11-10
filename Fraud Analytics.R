library(benford.analysis)
library(BenfordTests)

Vendor_Payments <- read_excel("Vendor Payments.xlsx")

vp <- Vendor_Payments
head(vp,2)
dim(vp)

#benford analysis
bfd.vp=benford(vp$InvAmount,number.of.digits = 2,sign = "positive")
fur_anl <- getSuspects(bfd.vp,vp)
dim(fur_anl)

plot(bfd.vp)

#Chi-squared test on the sample's first digits using defaults
chisq.benftest(vp$InvAmount)

chi <- chisq.benftest(vp$InvAmount,digits=2)

benford



###########Credit card dataset#########
library(dplyr)  #datamanipulation
library(caTools)  #data splitting
library(caret)  #model evaluation
library(randomForest)  #random forest model
library(ROSE)  #for random oversampling

data <- read.csv("D:/Academic/MBA/MBA 3rd Semester/R/AFA/creditcard.csv")
head(data)
str(data)  #displays structure
class(data)
sum(is.na(data))  #should return 0
dim(data)
data[4]
# Split the data into training and testing sets (70% training, 30%testing)
set.seed(123) #for reproductability
split <- sample.split(data$Class,SplitRatio = 0.7)
# True means Training
train_data <- subset(data,split == TRUE)
test_data <- subset(data,split == FALSE)
sum(train_data$Class)

#Apply rose to balance the training data
train_data_rose <- ROSE(Class~.,data = train_data, seed = 123)$data

#check the class distribution after ROSE
table(train_data_rose$Class)

# Now train the Random Forest model on the ROSE balanced data
set.seed(123)
rf_model <- randomForest(Class~.,data=train_data_rose,ntree = 50, importance= TRUE)
#Make predictions on the test data
rf_predictions <- predict(rf_model,newdata = test_data)
  
