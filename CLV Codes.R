library(boot) 
library(car)
library(QuantPsyc)
library(lmtest)
library(sandwich)
library(vars)
library(nortest)
library(MASS)

setwd()

data1<- read.csv("Fn-UseC_-Marketing-Customer-Value-Analysis.csv")
data<- data1
str(data)
summary(data)

##Renaming the dep var column
names(data)[names(data) == "Customer.Lifetime.Value"] <- "clv"

## Checking for outliers and possible data loss
quantile(data$clv, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.99,0.995,1))
## removing the outliers
data2 <- data[data$clv <36000, ]
## Checking for outliers
quantile(data2$clv, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.99,0.995,1))
data3 <- data[data$clv <14722, ]
quantile(data3$clv, c(0,0.05,0.1,0.25,0.5,0.75,0.90,0.95,0.99,0.995,1))
## counting the new dataset
nrow(data3)
## counting the old dataset
nrow(data)
## creating a backup dataset
data<- data3

## Check the missing value (if any)
sapply(data, function(x) sum(is.na(x)))

## Dropping the redundant variable - customer id, state, date
data<- data[,-c(1,2,7)]
str(data)



str(data)
##Exporting the file back to your local drive

write.csv(data,"data.csv")


# Training and Test data
library(caTools)
set.seed(123)
sample <- sample.split(data,SplitRatio = 0.75) # splits the data in the ratio mentioned in SplitRatio. After splitting marks these rows as logical TRUE and the the remaining are marked as logical FALSE

ori_data <- subset(data,sample ==TRUE) # creates a training dataset named train1 with rows which are marked as TRUE
test_data <- subset(data, sample==FALSE)


nrow(ori_data)
nrow(test_data)


##

fit<- lm(clv~ Response +	Coverage +	Education +	EmploymentStatus +	Gender +	Income +	Location.Code 
         +	Marital.Status +	Monthly.Premium.Auto +	Months.Since.Last.Claim +	Months.Since.Policy.Inception 
         +	Number.of.Open.Complaints +	Number.of.Policies +	Policy.Type +	Policy +	Renew.Offer.Type 
         +	Sales.Channel +	Total.Claim.Amount +	Vehicle.Class +	Vehicle.Size , data=ori_data)
summary(fit)



## Removing Policy  and Policy type 
fit<- lm(clv~ Response +	Coverage +	Education +	EmploymentStatus +	Gender +	Income +	Location.Code 
         +	Marital.Status +	Monthly.Premium.Auto +	Months.Since.Last.Claim +	Months.Since.Policy.Inception 
         +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	Sales.Channel +	Total.Claim.Amount +	Vehicle.Class +	Vehicle.Size , data=ori_data)
summary(fit)

## Removing Sales.Channel, Total.Claim.Amount, Gender ,	Income ,	Location.Code ,Marital.Status 
fit<- lm(clv~ Response +	Coverage +	Education +	EmploymentStatus +	 +	Monthly.Premium.Auto +	Months.Since.Last.Claim +	Months.Since.Policy.Inception 
         +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	Vehicle.Class +	Vehicle.Size , data=ori_data)
summary(fit)



## Removing  Months.Since.Policy.Inception, Vehicle.Class except SUV, Vehicle.Size except Small
fit<- lm(clv~ Response +	Coverage +	Education +	EmploymentStatus +Monthly.Premium.Auto +	Months.Since.Last.Claim 
         +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	I(Vehicle.Class=="SUV") +	I(Vehicle.Size=="Small") , data=ori_data)
summary(fit)

## Removing  Months.Since.Last.Claim, I(Vehicle.Size=="Small"), Response 
fit<- lm(clv~ 	Coverage +	Education +	EmploymentStatus +Monthly.Premium.Auto  
         +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	I(Vehicle.Class=="SUV")  , data=ori_data)
summary(fit)

## Removing  Months.Since.Last.Claim, I(Vehicle.Size=="Small"), Response 
fit<- lm(clv~ 	Coverage +	Education +	EmploymentStatus +Monthly.Premium.Auto  
         +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	I(Vehicle.Class=="SUV")  , data=ori_data)
summary(fit)

## Removing  Education except College and High School or Below
fit<- lm(clv~ 	Coverage +	I(Education=="College")+I(Education=="High School or Below") +	EmploymentStatus 
         +Monthly.Premium.Auto  +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	I(Vehicle.Class=="SUV")  , data=ori_data)
summary(fit)


## Removing  Employmentstatus employed ,I(Education=="High School or Below")
fit<- lm(clv~ 	Coverage +	I(Education=="College") 
         + I(EmploymentStatus=="Medical Leave")+ I(EmploymentStatus=="Retired")+ I(EmploymentStatus=="Unemployed")
         +Monthly.Premium.Auto  +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	I(Vehicle.Class=="SUV")  , data=ori_data)
summary(fit)




##Final model 
## Removing Vehecle Size , Marital.Status Renew.Offer.TypeOffer 3
fit<- lm(clv~ 	Coverage +	I(Education=="College") 
         + I(EmploymentStatus=="Medical Leave")+ I(EmploymentStatus=="Retired")+ I(EmploymentStatus=="Unemployed")
         +Monthly.Premium.Auto  +	Number.of.Open.Complaints +	Number.of.Policies +	Renew.Offer.Type 
         +	I(Vehicle.Class=="SUV")  , data=ori_data)
summary(fit)

#Check Vif, vif>2 means presence of multicollinearity
vif(fit)



## Get the predicted or fitted values
fitted(fit)

## MAPE
ori_data$pred <- fitted(fit)
#write.csv(ori_data,"mape.csv")

#Calculating MAPE
install.packages("Metrics")
library(Metrics)
mape(clv,pred)

attach(ori_data)
mean((abs(clv-pred)/clv))

############ Residual Analysis ############################################################################

res <- ori_data

res$stu_res <- studres(fit) ##Studentized residuals
res$stud.del.resids <- rstudent(fit) ##studentized deleted residuals
res$leverage <- hatvalues(fit) ## leverage values (hi)
res$cooks_dis <- cooks.distance(fit) ## Cook's distance
res$dffits <- dffits(fit) ## Dffit
res$dfbetas <- dfbetas(fit) ## Dfbetas
res$cov_ratio <- covratio(fit) ## Covariance Ratio


#write.csv(res,"res.csv")

##################################### Checking of Assumption ############################################

# residuals should be uncorrelated ##Autocorrelation
# Null H0: residuals from a linear regression are uncorrelated. Value should be close to 2. 
#Less than 1 and greater than 3 -> concern
## Should get a high p value

durbinWatsonTest(fit) #Car package


# Checking multicollinearity
vif(fit) # should be within 2. If it is greater than 10 then serious problem

################ Constant error variance ##########Heteroscedasticity


# Breusch-Pagan test
bptest(fit)  
# Null hypothesis -> error is homogenious (p value should be more than 0.05)
#the variance is unchanging in the residual) can be rejected and therefore heterscedasticity exists

#Cook-Weisberg test --- Car package
# hypothesis of constant error variance against the alternative that the error variance changes with the level of the  response 
# p value should be more than 0.05

ncvTest(fit)

## Normality testing Null hypothesis is data is normal.

resids <- fit$residuals


ad.test(resids) #get Anderson-Darling test for normality 

hist(resids)
qqnorm(resids)


###########################################################################################################################
############## Testing the model on test data ############################################################################
###########################################################################################################################

test_prediction <- predict(fit,test_data)
test_data$predicted <- test_prediction

attach(test_data)
plot(clv,predicted)
mean((abs(clv-predicted)/clv))

detach(test_data)

test_data$test_res <- test_data$clv - test_data$predicted 
plot(test_data$test_res)

