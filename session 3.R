########################################################################### ###################################

### Loop ###
### For Loop ###

## create 10 numbers and print it
for(i in 1:10){
  print(i)
}




##################################  ## while loop  #########################################################
y <- 0
i <- 100
while (i <= 200){
  i <- i+(i*.085)
  y <- y+1
  print(i)
  print(y)
}

##function with while loop

f<- function(x,z){
  y <- 0
  i <- x
  while (i <= z){
    i <- i+(i*.085)
    y <- y+1
    print(i)
    print(y)
  }
  return(c(i,y))
}
f(100000,210000)


##################################  ## repeat loop  #########################################################
## It will continue to repeat till the breaking condistion meets
i <- 2 
repeat {
  print(i)
  i <- i+1
  if(i > 4)
    break
}

## if break is omitted then it will continue till the end of the world
i <- 2 
repeat {
  print(i)
  i <- i+1	
}



######################## Character Functions and other tricks ##################################################
####Functions
## searches and matches the string within the larger string
# shows the number of characters
nchar("Subhojit Sengupta")


## substring 
substring("Equator",1,3)

## string split
x <- c("Salman Khan is a good boy@cute")
x

strsplit(x,split=" ")





###############################################################################################################

## You create a data frame
name <- c("A","B","C","D","E","F","G","H","I","J")
age <- c(22,43,12,17,29,5,51,56,9,44)
sex <- c("M","F","M","M","M","F","F","M","F","F")
data <- data.frame(name,age,sex, stringsAsFactors=FALSE)
data



data<- data[,c(1,2,3)]
d<- data[,c(2:3)]

###select columns and reorder it
d <- subset(data,select=c(age,name))
d


## shows how to chnage the name of a column
names(data)
names(data)[2]<- "ages"
names(data)[c(1,2,3)]<- c("names","ages","sexes")
names(data) <- c("name","age","sex")

## how to check the mode of the variable
class(data$name)
class(data$age)

## Write functions
subhojit <- function(x,y){
  x+y
}

# recall function
subhojit(2,1)
subhojit(5,3)

## mroe than 1 calculation

s<- function(x,y){
  2*x + y
  x + 2*y
  2*x + 2*y
  x/y
}

s(2,1) ## produces only the last output

## You have store them
s<- function(x,y){
  z1 <- 2*x + y
  z2 <- x + 2*y
  z3 <- 2*x + 2*y
  z4 <- x/y
}

s(2,1)

## You have store them
s<- function(x,y){
  z1 <- 2*x + y
  z2 <- x + 2*y
  z3 <- 2*x + 2*y
  z4 <- x/y
  return (c(z1,z2,z3,z4))
}

s(2,1)




#################### Apply Function#######################
?apply
mtcars

## summary statistics
data$mean <- apply(data[2],2,mean) ## 2 means average of column
data$mean1 <- apply(data[c(2,4)],1,mean)## 1 means average of row
data$sd <- apply(data[c(2,4)],1,sd)## 1 means average of row
data
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


#################### L Apply ##############################
#lapply() function is useful for performing operations on list objects and returns a list object of same length of original set. 
#lappy() returns a list of the similar length as input list object,
#each element of which is the result of applying FUN to the corresponding element of list


movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

#We can use unlist() to convert the list into a vector.
movies_lower <-unlist(lapply(movies,tolower))
str(movies_lower)


################## S Apply #################
#sapply() function takes list, vector or data frame as input and gives output in vector or matrix. 
#It is useful for operations on list objects and returns a list object of same length of original set. 
#Sapply function in R does the same job as lapply() function but returns a vector.

cars
dt <- cars
lmn_cars <- lapply(dt, min)
smn_cars <- sapply(dt, min)
smn_cars

lmn_cars

##################### T Apply #################################
#tapply() computes a measure (mean, median, min, max, etc..) or a function for each factor variable in a vector. 
#It is a very useful function that lets you create a subset of a vector and then apply some functions to each of the subset.

data(iris)
tapply(iris$Sepal.Width, iris$Species, median)


#load ggplot2
library(ggplot2)
# load data
data(diamonds)

# print head of diamonds dataset
print(" Head of data:")
head(diamonds)

# apply tapply function to get average price by cut
print("Average price for each cut of diamond:")
tapply(diamonds$price, diamonds$cut, mean)

####### New Packages in R ################

install.packages('sqldf')
library(sqldf)


## https://cran.r-project.org/web/packages/sqldf/index.html

## You create a vector
name <- c("A","B","C","D","E","F","G","H","I","J")
age <- c(22,43,12,17,29,5,51,56,9,44)
sex <- c("M","F","M","M","M","F","F","M","F","F")


## You create a data frame
data <- data.frame(name,age,sex, stringsAsFactors=FALSE)
data

## Read all data##
sqldf("select * 
from data")

## Read some variables##
sqldf("select name, age 
from data")

## creating Alias
sqldf("select name as full_name, age as total_age
from data")

## storing result with condition ##
p<- sqldf("select * 
from data 
where age > 20")
p

## create new column with condition##
sqldf("select *, 
age+10 as age_sum
from data")

## descriptive stat in SQl
sqldf("select 
min(age) as min_age,
max(age) as max_age,
avg(age) as avg_age,
count(age) as cnt_age,
sum(age) as sum_age
from data")

## descriptive stat in SQl - segregated by sex 
sqldf("select sex, 
min(age) as min_age,
max(age) as max_age,
avg(age) as avg_age,
count(age) as cnt_age,
sum(age) as sum_age
from data
group by sex")

## descriptive stat in SQl - segregated by sex - descending sorted by sex
sqldf("select sex, 
min(age) as min_age,
max(age) as max_age,
avg(age) as avg_age,
count(age) as cnt_age,
sum(age) as sum_age
from data
group by sex
order by sex desc")

## else if statement
d<- sqldf("select *,
case 
when age <= 20 then  'A'
when age > 20 and age <= 40 then 'B'
else 'C' 
end trip
from data
order by trip")
d

## filtering data
sqldf("select *
from data
where age > 40")


## always use "having" with group by and on summary statistics
## usage of having statement
sqldf("select sex, age,
max(age) as max_age,
min(age) as min_age
from data
group by sex
having max_age - min_age > 0")



## remove duplicates
sqldf("select distinct sex
from data")

## new field 
sqldf("select *, square(age) sqr_age, sqrt(age) sqrt_age, avg(age) mean
from data")


write.csv(data,"C:\\Subhojit\\data.csv")

## filtering using where
sqldf("select * 
from data
where age >12")


## sort the data - descending order. for ascending order just omit the desc keyword
sqldf("select * 
from data
order by age desc")

## counting frequencies
d
sqldf("select trip, count(trip) ct,avg(age)avg_age 
from d
group by trip
having avg_age >= 11")


##################### DPLYR ######################################
#The dplyr package in R Programming Language is a structure of data manipulation
#that provides a uniform set of verbs, helping to resolve the most frequent data manipulation hurdles

install.packages("dplyr") ## install
library(dplyr)

##filter() Function:

# sample data
df=data.frame(x=c(12,31,4,66,78),
              y=c(22.1,44.5,6.1,43.1,99),
              z=c(TRUE,TRUE,FALSE,TRUE,TRUE))

# condition
filter(df, x<50 & z==TRUE)


##another ex.
df=data.frame(x=c(12,31,4,66,78),
              y=c(22.1,44.5,6.1,43.1,99),
              z=c(TRUE,TRUE,FALSE,TRUE,TRUE))

df %>%
  filter(y < 45, z != FALSE)

# using NA for filtering
df=data.frame(x=c(12,31,NA,NA,NA),
              y=c(22.1,44.5,6.1,10,99),
              z=c(TRUE,TRUE,FALSE,TRUE,TRUE))

df %>% filter(!is.na(x))

###     arrange(): For reordering of the cases.
# Create a data frame with missing data
d <- data.frame( name = c("Abhi", "Bhavesh", "Chaman", "Dimri"),
                 age = c(7, 5, 9, 16),
                 ht = c(46, NA, NA, 69),
                 school = c("yes", "yes", "no", "no") )

# Arranging name according to the age
d.name<- arrange(d, age)
print(d.name)

#### select() and rename()

# startswith() function to print only ht data
select(d, starts_with("ht"))

# -startswith() function to print
# everything except ht data
select(d, -starts_with("ht"))

# Printing column 1 to 2
select(d, 1: 2)

# Printing data of column
# heading containing 'a'
select(d, contains("a"))

# Printing data of column
# heading which matches 'na'
select(d, matches("na"))

####  mutate() and transmute(): Addition of new variables which are the functions of prevailing variables.
# Calculating a variable x3 which is sum of height
# and age printing with ht and age
mutate(d, x3 = ht + age)

# Calculating a variable x3 which is sum of height
# and age printing without ht and age
transmute(d, x3 = ht + age)


###summarise(): Condensing various values to one value.

# Calculating mean of age
summarise(d, mean = mean(age))

# Calculating min of age
summarise(d, med = min(age))

# Calculating max of age
summarise(d, med = max(age))

# Calculating median of age
summarise(d, med = median(age))
#--------------------------------------------------------------------------------------
oj <- read.csv("C:/Users/s.sethia/OneDrive - CRITEO/Desktop/Ivy Pro/Ivy Pro/R/oj.csv",header=TRUE)

# Basic Exploration
View(oj)
names(oj)
str(oj)
head(oj) #top 6
tail(oj) #last 6
summary(oj)

oj$brand <- as.character(oj$brand)
oj$brand <- as.factor(oj$brand)

table(oj$week) #count per observation
oj[1,3] # data.frame[row , column]
oj[c(1,12,38,256) ,c(1,3,6) ] #combination = c()
oj[1:5,c("brand","feat")] # BRAND!=brand

dat <- oj[oj$brand=="dominicks", ] #select (column)* from oj where (row) brand = "dominiks"
summary(dat)
dim(dat)
table(dat$brand)

dat1 <- oj[oj$brand=="dominicks" | oj$brand=="tropicana", ]

# select * from oj where brand in ("dominicks","tropicana")
head(dat1,4) #top 6 by default
table(dat1$brand)
dim(dat1)
dat2 <- oj[oj$brand=="tropicana" & oj$feat==1, ]
dim(dat2)
d1 <- oj[oj$brand == "dominicks" | oj$brand == "minute.maid" & oj$feat == 0,]

dim(d1)
d2 <- oj[(oj$brand == "dominicks" | oj$brand == "minute.maid") & oj$feat == 0,]

#(A or B) & c -> 
dim(d2)

x <- 17:33

which(x > 26)

index <- which(oj$brand=="dominicks")
head(index)

dat2 <- oj[which(oj$brand=="dominicks") , ]
dat31 <- subset(oj,oj$brand=="crest")

dat31 <- subset(oj,oj$brand=="crest",select=c(logmove,INCOME)) #keep keyword in SAS

dat32 <- subset(oj,oj$brand=="crest",select=c(-week,-brand)) #drop keyword in SAS

dat4 <- oj[ , c("brand","feat")] # 2 columns
dat4.1 <- oj[,c(4:6)] # filtering of columns based on index of column

which(colnames(oj) =="feat" ) 

dat4.2 <- oj[,-c(3:5)] #drop of column numbers from 3 to 5 (3 4 5)

dat5 <- oj[oj$brand=="dominicks" & oj$feat==0,c("week","store")]
head(dat5)


# mysplit <- split(oj, oj$brand)
# summary(mysplit)

oj$logInc <- log(oj$INCOME)#  creating a new variable

oj$flag <- ifelse(oj$brand=="tropicana", 1,0)
dim(oj)
table(oj$flag)


# aggregate function in sql min, max, sum, avg, count, SD

agg <- aggregate(oj$price,
                 by=list(oj$brand),
                 FUN=mean) 

class(agg)
# family of apply function ...apply sapply lapply tapply
#tapply(numeric variable, on what basis(class), function)
tap <- tapply(oj$price,oj$brand, mean) #pivot equivalent in R
tap

tap1 <- tapply(oj$price, INDEX = list(oj$brand,oj$store), mean)
tap1
#Merging and Join
df1 = data.frame(CustomerId=c(1,2,3,4,5,6,
                              7,8,9,10,11,12),
                 Product=c("Toaster","Radio","TV",
                           "Toaster","Radio","TV",
                           "Toaster","Radio","TV",
                           "Toaster","Radio","TV"))
df2 = data.frame(CustomerId=c(1,9,3,18,5,6,7,8),
                 State=c("Alabama","Ohio","California",
                         "Nebraska","Alabama","Ohio",
                         "New Jersey","Iowa"))


merge(x = df1, y = df2, by = "CustomerId", all = TRUE) #full join
merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE) #left join
merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE) #right join 
merge(x = df1, y = df2, by = "CustomerId") #inner join 


#dplyr package

#install.packages("dplyr")
library(dplyr)

str(oj)
glimpse(oj) #dplyr
dat1 <- filter(oj,brand=="dominicks")
head(dat1)

dat2 <- filter(oj,brand=="dominicks" | brand=="tropicana")
dat2
#filter(dataset name, row condition, column condition)
dat3 <- filter(oj,brand=="tropicana",feat==0)
head(dat3)


dat4 <- filter(oj,brand=="minute.maid" & feat==1)
head(dat4)


# %in% operator

filter(oj,brand %in% c("minute.maid","tropicana"))

filter(oj,brand=="minute.maid"|brand=="tropicana")

filter(oj,between(ETHNIC, 0.1, 0.2)) # where ethnic between .1 and .2

filter(oj,ETHNIC >= 0.1 & ETHNIC <= 0.2)
ojnew <- filter(oj,!is.na(WORKWOM)) #is.na !is.na
slice(oj,1213:1218) #filtering of row oj[1213:1218,]

sample_n(oj,12)


set.seed(133)

sample(1:10, 1)

sample_frac(oj,0.1, replace=TRUE) #fraction of 10%

a <- top_n(oj,5,week)

top_n(oj,5,-logmove)

head(select(oj,brand,INCOME,feat)) #keep

head(select(oj,-brand,-INCOME,-feat)) #drop

head(select(oj,week:price))

head(select(oj,contains("SSTR"))) #filtering on the basis of contains or like

headselect(oj,starts_with("E",ignore.case=TRUE))) #find(i) 

select(oj,ends_with("0",ignore.case = FALSE))

select(oj,matches("[cw]",ignore.case=TRUE)) #which contains c or w or both

colnames(oj)[2] <- "brand"
colnames(oj)

#rename(oj, new value = previous value)
dat1 <- rename(oj,zone=flag)
head(dat1)

dat12 <- mutate(oj,logIncome=log(INCOME,base = 10))
head(dat12)
glimpse(dat12)


mutate_each(oj,funs(mean), 
            INCmean = INCOME, 
            AGE60mean = AGE60,
            ETHNmean = ETHNIC)


head(mutate_each(oj,funs(sqrt,log), INCOME, AGE60, ETHNIC))

head(transmute(oj,units=exp(logmove)))

#sorting of data dplyr package
dat13 <- arrange(oj,INCOME)
head(dat13)
dat13 <- arrange(oj,-INCOME)
head(dat13)
dat14 <- arrange(oj,desc(INCOME))
head(dat14)
dat14 <- arrange(oj,-INCOME, -week) #proc sql order by income desc 
View(dat14)
