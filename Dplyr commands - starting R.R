#Installing MASS library#
library(MASS)

#Calling for all pre-installed datasets in R#
data()

#Installing package swirl#
install.packages("swirl")
library(SWIRL)

#Installing package dplyr and calling its library# 
library(dplyr)

#calling pre-installed data-set mtcars and iris#
data("mtcars")
data("iris")
mydata <- mtcars

#checking the headings for the dataset#
names(mydata)

#Head command calls for a sample of dataset. in this case 10 rows#
head(mydata,n=10)

#Creating a new variable using data frames#
mynewdata <- data.frame(mydata)
myirisdata <- data.frame(iris)
head(mynewdata, n=10)
head(myirisdata)

#dplyr package is used for data manipulation; filter is one of the command#
filter(mynewdata,wt>2.8 & vs==1)

#Select command is to select the columns which need to be displayed#
select(mynewdata,mpg,cyl)
select(mynewdata,-c(mpg,cyl))

#Multiple data manipulation commands#
mynewdata %>% select(disp,hp,drat,wt,vs)  %>% filter(mynewdata$vs==1)
mynewdata %>% select(disp,hp,drat,wt,vs) %>% arrange(desc(wt))

#Mutate command is used to create another variable in the dataset#
mynewdata %>% select(disp,hp,drat,wt,vs) %>% mutate(gear_carb=mynewdata$gear*mynewdata$carb)
myx <- mynewdata %>% select(disp,hp,drat,wt,vs) %>% mutate(gear_carb=mynewdata$gear*mynewdata$carb)
filter(myx,gear_carb>4)

head(myirisdata,n=10)

#Summarising myiris data by variable "species" and calling out mean function#
myirisdata %>% group_by(Species) %>% summarise_each(funs(mean, n()), Sepal.Length, Sepal.Width)

#Renaming a variable#
str(myirisdata)
names(myirisdata)[3]="PL"
str(myirisdata)

