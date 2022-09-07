
a = 1
print('hello')

## Vector
1:10 # sequence
16:7 # opposite sequence
c(1,1:3, c(7,8,9),13)

## Storing the data
x <- c(1,1:3, c(7,8,9),13)
x


z<- c("Pintu", "Joyita", "Dhananjay")
typeof(z) ## Character

##Test the type of data
is.character(z)


## Vector can contain only 1 type of data
v <- c(1,2,3,TRUE,"Pintu")
typeof(v) ## the whole vector has become character



x<- factor(c(1,2,3,4))
typeof(x)## data type will not change
str(x) ## property will be changed
levels(x) # shows the different levels

## You create a vector
name <- c("A","B","C","D","E","F","G","H","I","J")
age <- c(22,43,12,17,29,5,51,56,9,44)
sex <- c("M","F","M","M","M","F","F","M","F","F")


## You create a data frame
data <- data.frame(name,age,sex, stringsAsFactors=FALSE)
data
str(data)

## Access the data with component values or name of the columns
data[[1]]
data$age


## Types of data :
###Nominal Data is used to label variables without any order or quantitative value. 
      #The colour of hair can be considered nominal data, as one colour can't be compared with another colour.

##Ordinal data have natural ordering where a number is present in some kind of order by their position on the scale. 
      #These data are used for observation like customer satisfaction, happiness, etc., but we can't do any arithmetical tasks on them

## Discrete data :The term discrete means distinct or separate. The discrete data contain the values that fall under integers or whole numbers. 
      #The total number of students in a class is an example of discrete data.

##Continuous data are in the form of fractional numbers. 
     #It can be the version of an android phone, the height of a person, the length of an object, etc. Continuous data represents information that can be divided into smaller levels.


## extract data from a data frame
## first 3 rows of all columns
data[1:3,]

##first 3 rows of 2nd columns
data[1:3,2]

## You can also look at it in a matrix fashion
str(data)

#filtering
data[data$sex == "M",] ## equal to
data[data$sex != "M",] ## not equal to
data[data$age >= 20,] ## greater than equal to
data[data$age <= 20,] ## less than equal to
data[data$sex != "M" & data$age <= 10,] ## two conditions with "and"
data[data$sex != 'M' &! data$age <= 10,] ## two conditions with "and" (and "not")
data[data$sex != "M" | data$age >= 10,] ## two conditions with or



### Reading the datasets into R

setwd('D:\\Piyush\\Analyticsiseasy\\R')

r<- read.csv("R1.csv")
r1<- read.csv("R2.csv")
r

library("readxl")
r1 =read_excel("C:\\Users\\s.sethia\\OneDrive - CRITEO\\Desktop\\Ivy Pro\\Ivy Pro\\R\\R1.xlsx")



## quartiles
#define dataset
data = c(4, 7, 12, 13, 14, 15, 15, 16, 19, 23, 24, 25, 27, 28, 33)

#calculate quartiles of dataset
quantile(data)
quantile(data , c(.25,.35,.45,.55))



## You create a data frame
name <- c("A","B","C","D","E","F","G","H","I","J")
age <- c(22,43,12,17,29,5,51,56,9,44)
sex <- c("M","F","M","M","M","F","F","M","F","F")
data <- data.frame(name,age,sex, stringsAsFactors=FALSE)
data
##creating new column with condition
## equal to (==)
data$gender <- ifelse(sex =="M","Male","Female")
data

## not equal to (!=)
data$gender <- ifelse(sex != "M","FeMale","Others")
data

##creating new column with multiple condition

## AND (& )
data$status <- ifelse(sex=="F" & age <= 25,"Young Female",ifelse(sex=="F" && age >= 25,"Old Female","Male"))
data

## OR (|)
data$status <- ifelse(sex=="F" | name== "A","Female","Correct")
data
####Creating rank of a variable

data$rank_age <- rank(data$age)
data$rank_sex <- rank(data$sex)
data

##Sorting the dataset by rank_age
data[order(data$rank_age),]

#The interquartile range (IQR) measures the spread of the middle half of your data. 
#It is the range for the middle 50% of your sample. 
#Use the IQR to assess the variability where most of your values lie

#define vector with some missing values
x <- c(4, 6, NA, 7, NA, NA, 15, 17, 20, 21, 21, 23, 24, 27, 28)

#calculate interquartile range of values in vector
IQR(x, na.rm=TRUE)

#define data frame
df <- data.frame(var1=c(1, 3, 3, 4, 5),
                 var2=c(7, 7, 8, 3, 2),
                 var3=c(3, 3, 6, 6, 8),
                 var4=c(1, 1, 2, 8, 9))

#calculate interquartile range of 'var1' column
IQR(df$var1)

## Boxplot
data("mtcars")
mtcars$mpg
input <- mtcars[, c('mpg', 'cyl')]
print(head(input))
# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars,
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon",
        main = "Mileage Data")

set.seed(20000) 

# Applying boxplot function
boxplot(data)


# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars,
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon",
        main = "Mileage Data",
        notch = TRUE,
        varwidth = TRUE,
        col = c("green", "red", "blue"),
        names = c("High", "Medium", "Low")
)






########### Box Plot ############################

head(mtcars)
boxplot(mtcars$mpg)

library(nlme)

head(MathAchieve)

boxplot(MathAchieve$MathAch,
        main = "Math Achievement Scores", ylab = "Scores")

boxplot(MathAchieve$SES,
        main = "Socioeconomic Status", ylab = "SES score")




#Variance is the average squared deviations from the mean, while standard deviation is the square root of this number. 
#Both measures reflect variability in a distribution, but their units differ: 
#Standard deviation is expressed in the same units as the original values

# Variance function in R
var(mtcars$mpg)
var(mtcars$wt)
# SD function in R

sd(mtcars$mpg)
sd(mtcars$wt)

# mean , median
library(datasets)
data(iris)
summary(iris)
mean(iris$Sepal.Length)
median(iris$Sepal.Length,na.rm = TRUE)

### List of statistics which can be used are as follows:
# mean # Average
# median # Median
# sd ## Standard Deviation
# mad ## Mean absolute deviation
# max # Maximum
# min # Minumum
# sum # Sum
# prod # Product
# length # Number of observations


#A sampling distribution is a probability distribution of a statistic obtained 
#from a larger number of samples drawn from a specific population. 
#The sampling distribution of a given population is the distribution of 
#frequencies of a range of different outcomes that could possibly occur for a statistic of a population.

# define number of samples
n = 1000

# create empty vector of length n
sample_means = rep(NA, n)

# fill empty_vector with means
for(i in 1: n){
  sample_means[i] = mean(rnorm(20, mean=10, sd=10))
}
head(sample_means)

# create histogram to visualize
hist(sample_means, main="Sampling Distribution",
     xlab="Sample Means", ylab="Frequency", col="blue")

# To cross check find mean and sd of sample
mean(sample_means)

sd(sample_means)

# To find probability
sum(sample_means >= 10)/length(sample_means)

#Normal distribution, also known as the Gaussian distribution, is a probability distribution that is symmetric about the mean, showing that data near the mean are more frequent in occurrence than data far from the mean. 
#In graphical form,the normal distribution appears as a "bell curve".

# Non normal data
x <- c(0.103, 0.528, 0.221, 0.260, 0.091,
       1.314, 1.732, 0.244, 1.981, 0.273,
       0.461, 0.366, 1.407, 0.079, 2.266)

# Histogram of the data
hist(x)
#install.packages('MASS')
library(MASS)
#converting to normal data using Box cox
boxcox(lm(x ~ 1))
# extracting the lambda values
b <- boxcox(lm(x ~ 1))

# Exact lambda
lambda <- b$x[which.max(b$y)]


#The correlation coefficient ( r ) measures the strength and direction of (linear) relationship between the two quantitative variables. 
#r can range from +1 (perfect positive correlation) to -1 (perfect negative correlation). 
#The positive values of r indicate the positive relationship and vice versa

#correaltion function 
cor(x,y)
cor(mtcars$mpg , mtcars$wt)
cor(mtcars)


# Data generation
set.seed(1)
x <- 1:100
y <- x + rnorm(100, mean = 0, sd = 15)

# Creating the plot
plot(x, y, pch = 19, col = "lightblue")
# Pearson correlation
text(paste("Correlation:", round(cor(x, y), 2)), x = 25, y = 95)



# Regression line
#abline(lm(y ~ x), col = "red", lwd = 3)

# Plot correlation matrix
pairs(iris)

# Equivalent with a formula
pairs(~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris)
 install.packages("corrplot")
library(corrplot)
      

 
             #### Sesssion 2####
 ------------------------------------------------------------
 ------------------------------------------------------------
#Creating a Graph provides an overivew of creating and saving graphs in R.
# Creating your first  Graph on R 
 
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
   
########## Histogram   ##########

# Simple Histogram
hist(mtcars$mpg)

# Colored Histogram with Different Number of Bins
hist(mtcars$mpg, breaks=12, col="red")   
   
   
   
# #############################  Scatter Plot  #################################
 x <- c(1:10)
 y <- c(101:110)
 plot(x,y,pch=15)
 
 head(mtcars)
 plot(mtcars$wt, mtcars$mpg, pch=19)
 
 
 
 ##################### Barplot ################################
 
 head(mtcars)
 barplot(mtcars$carb,col="sea green")
 barplot(mtcars$drat, col="skyblue")
 

 
 
 
 #### Difference between barplot and histogram ###############################
 ## Histogram shows frequency distribution where as barplot simply plots the datapoint as it comes in the data
 
 d<- c(9,4,4,5,5,5,6,6,6,6,7,7,7,8,8,2)
 
 hist(d,col="skyblue")
 barplot(d,col="yellow")
 
 
 
 ##################### Pie Chart #############################################################################
 
 liquor <- c(10,12,4,18,9)
 lbls <- c("Grants","Jack Daniels","Johnnie Walker","J&B","Chivas Regal")
 
 pie(liquor, labels=lbls, main = "Distribution of Beverages", col=rainbow(length(lbls)))
 library(nortest)
 head(mtcars)
 hist(mtcars$mpg)
 barplot(mtcars$mpg)
 
 
 
#--------------Advanced Plotting--------------------# 
 
 # Enhanced Scatterplot of MPG vs. Weight
 # by Number of Car Cylinders
 library(car)
 scatterplot(mpg ~ wt | cyl, data=mtcars,
             xlab="Weight of Car", ylab="Miles Per Gallon",
             main="Enhanced Scatter Plot",
             labels=row.names(mtcars))
 
 
 # Simple Horizontal Bar Plot with Added Labels
 counts <- table(mtcars$gear)
 barplot(counts, main="Car Distribution", horiz=TRUE,
         names.arg=c("3 Gears", "4 Gears", "5 Gears"))
 
 # Stacked Bar Plot with Colors and Legend
 counts <- table(mtcars$vs, mtcars$gear)
 barplot(counts, main="Car Distribution by Gears and VS",
         xlab="Number of Gears", col=c("darkblue","red"),
         legend = rownames(counts))
 
 # Combining multiple plots in a single graph
 # 4 figures arranged in 2 rows and 2 columns
 attach(mtcars)
 par(mfrow=c(2,2))
 plot(wt,mpg, main="Scatterplot of wt vs. mpg")
 plot(wt,disp, main="Scatterplot of wt vs disp")
 hist(wt, main="Histogram of wt")
 boxplot(wt, main="Boxplot of wt")
 
# Graphical Parameters
 
# One can customize many features of your graphs (fonts, colors, axes, titles) through graphic options.
 
# One way is to specify these options in through the par( ) function. If you set parameter values here,
# the changes will be in effect for the rest of the session or until you change them again. The format is
# par(optionname=value, optionname=value, ...)
 
 # Set a graphical parameter using par()
 par()
 # view current settings
 opar <- par()
 # make a copy of current settings
 par(col.lab="red") # red x and y labels
 hist(mtcars$mpg) # create a plot with these new settings
 par(opar) # restore original settings
 
 # Set a graphical parameter within the plotting function
 hist(mtcars$mpg, col.lab="red")
 
 
 
# ------------- #GGplot2-----------------------
 
 # Installing the package
 install.packages("dplyr")
 
 # Loading package
 library(dplyr)
 
 # Summary of dataset in package
 summary(mtcars)
 
 # Loading packages
library(ggplot2)
library(dplyr)
 
 # Data Layer
 ggplot(data = mtcars)
 
 # Aesthetic Layer
 ggplot(data = mtcars, aes(x = hp, y = mpg, col = disp))
 
 # Geometric layer
 ggplot(data = mtcars, 
        aes(x = hp, y = mpg, col = disp)) + geom_point()
 
 # Adding size
 ggplot(data = mtcars, 
        aes(x = hp, y = mpg, size = disp)) + geom_point()
 
 # Adding color and shape
 ggplot(data = mtcars, 
        aes(x = hp, y = mpg, col = factor(cyl), 
            shape = factor(am))) +
   geom_point()
 
 # Histogram plot
 ggplot(data = mtcars, aes(x = hp)) +
   geom_histogram(binwidth = 5)
 
 
 # Statistics layer
 ggplot(data = mtcars, aes(x = hp, y = mpg)) + 
   geom_point() + 
   stat_smooth(method = lm, col = "red")
 
 # Histogram plot
 a=ggplot(data = mtcars, aes(x = hp)) +
   geom_histogram(binwidth = 5)

 # Saving plots to files in R 
 
################## #### Advanced Graphics on R############### 
 
 ## Correlogram Plot 
  library(corrgram)
 corrgram(mtcars, order=NULL, lower.panel=panel.shade,
          upper.panel=NULL, text.panel=panel.txt,
          main="Car Milage Data (unsorted)")
 
 
 ## Interact with R data using GGobi
library(rggobi)
g <- ggobi(mydata)

# Install iplots
install.packages("iplots",dep=TRUE)

# Create some linked plots
library(iplots)
cyl.f <- factor(mtcars$cyl)
gear.f <- factor(mtcars$factor)
attach(mtcars)
ihist(mpg) # histogram
ibar(carb) # barchart
iplot(mpg, wt) # scatter plot
ibox(mtcars[c("qsec","disp","hp")]) # boxplots
ipcp(mtcars[c("mpg","wt","hp")]) # parallel coordinates
imosaic(cyl.f,gear.f) # mosaic plot



################## Doughnut Charts##############

# load library
library(ggplot2)

# Create test data.
data <- data.frame(
  category=c("A", "B", "C"),
  count=c(10, 60, 30)
)

# Compute percentages
data$fraction = data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax = cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin = c(0, head(data$ymax, n=-1))

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  coord_polar(theta="y") + # Try to remove that to understand how the chart is built initially
  xlim(c(2, 4)) # Try to remove that to see how to make a pie chart

 
# Customisation for Doughnut Charts

# Create test data.
data <- data.frame(
  category=c("A", "B", "C"),
  count=c(10, 60, 30)
)

# Compute percentages
data$fraction <- data$count / sum(data$count)

# Compute the cumulative percentages (top of each rectangle)
data$ymax <- cumsum(data$fraction)

# Compute the bottom of each rectangle
data$ymin <- c(0, head(data$ymax, n=-1))

# Compute label position
data$labelPosition <- (data$ymax + data$ymin) / 2

# Compute a good label
data$label <- paste0(data$category, "\n value: ", data$count)

# Make the plot
ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category)) +
  geom_rect() +
  geom_text( x=2, aes(y=labelPosition, label=label, color=category), size=6) + # x here controls label position (inner / outer)
  scale_fill_brewer(palette=3) +
  scale_color_brewer(palette=3) +
  coord_polar(theta="y") +
  xlim(c(-1, 4)) +
  theme_void() +
  theme(legend.position = "none")
 

##################Heatmaps##########################
 
# Create example data
data <- matrix(rnorm(100, 0, 5), nrow = 10, ncol = 10)

# Column names
colnames(data) <- paste0("col", 1:10)
rownames(data) <- paste0("row", 1:10)

# Draw a heatmap
heatmap(data)   

################ Geocoding within R #######################
##Tell ggmap about the API key using the register_google() function. Use the 'write = TRUE' argument if you want to store the key globally in R, not just for this session.

#register_google(key = "[your Google API key]", write = TRUE)

#Use mutate_geocode() to create a new data frame with added columns for latitude and longitude coordinates (output = "latlon" argument).
#output = "latlona" returns latitude, longitude, and the matched address (to cross-check against your address) as new columns.

install.packages('ggpmap')

library(ggmap)
library(mapview)
addr <- data.frame(Address = c("4000 mayflower Hill, Waterville, Maine", 
                               "2 Andrews Rd, Lewiston, ME 04240",
                               "255 Maine St, Brunswick, ME 04011",
                               "90 Quaker Hill Rd, Unity, ME 04988",
                               "105 Eden St, Bar Harbor, ME 04609"),
                   College = c("Colby", "Bates", "Bowdoin", "Unity", "CoA"),
                   stringsAsFactors = FALSE)
addr.geo <- mutate_geocode(addr, location = Address, output = "latlona")
View(addr.geo)


 
 
 
 
 
 
 
 
 
 ## Superimpose a normal curve
 x<- mtcars$mpg
 m<-mean(x)
 std<-sqrt(var(x))
 hist(x, density=20, breaks=20, prob=TRUE, 
      xlab="x-variable", ylim=c(0, 0.15), 
      main="normal curve over histogram")
 curve(dnorm(x, mean=m, sd=std), 
       col="darkblue", lwd=2, add=TRUE)
 
 
 
 ############### Ideal Scenario ##################################
 
 ### Histogram with normally distributed numbers
 
 x<-rnorm(100000,mean=0, sd=1)
 hist(x)
 plot(y)
 
 
 # overlay normal curve with x-lab and ylim
 # colored normal curve
 m<-mean(x)
 std<-sqrt(var(x))
 hist(x, density=20, breaks=20, prob=TRUE, 
      xlab="x-variable", ylim=c(0, 0.7), 
      main="normal curve over histogram")
 curve(dnorm(x, mean=m, sd=std), 
       col="darkblue", lwd=2, add=TRUE)