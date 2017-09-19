# all about tibbles script
# last updated: 20170914


# ---- meet up schedule & objectives ----

# introductions

# objectives:
# 1. *explain* the difference between data frames and tibbles 
# 2. ????

# discussion: (list on the white board)
# what do you know about data frames?
# what do you know about tibbles?

# go through script below

# discussion/activity:
# beginner R users - ????
# advanced R users - look for some functions that do/don't allow tibbles (and share them)

# any last questions/issues/things you discovered and want to share?


# ---- setup ----

# install packages (if you haven't already. only need to do this once!)
install.packages("tidyverse","microbenchmark")

# load library
library(tidyverse)
# the tibble package is inside the tidyverse package
library(microbenchmark)

vignette("tibble") # for more info on tibbles
# note: this tutorial was adapted from this vignette!

# other help: https://blog.rstudio.com/2016/03/24/tibble-1-0-0/


# ---- tibbles are lazy ----

# tibbls will not adjust the names of variables
names(data.frame(`some crazy name`=1)) # do you notice the .'s where the spaces were?

names(tibble(`some crazy name`=1))

# tibbles will not change an input type
my_df=data.frame(x=letters)
class(my_df$x) # factor

my_tib=tibble(x=letters)
class(my_tib$x) # character

# tibbles will only shows some of output in console window
my_df

my_tib

# tibbles will allow column entries to be lists
my_df2=data.frame(x=1:3,y=list(1:5,1:10,1:20))
my_df2

my_tib2=tibble(x=1:3,y=list(1:5,1:10,1:20))
my_tib2

# tibbles will do things in sequence 
my_db3=data.frame(x=1:5,y=x^2)
my_db3

my_tib3=tibble(x=1:5,y=x^2)
my_tib3

# tibbles are more computationally efficient (leaves more time to be lazy)
my_list=replicate(26,sample(100),simplify=FALSE)
# 26 nested lists with 100 randome samples in each
my_list
names(my_list)=letters
microbenchmark::microbenchmark(as_tibble(my_list),
                               as.data.frame(my_list))


# ---- tibbles are surly ----

# tibbles are strict about subsetting (always returning a tibble)
my_df4=data.frame(x=1:3,y=3:1)
class(my_df4[,1:2])
class(my_df4[,1])

my_tib4=tibble(x=1:3,y=3:1)
class(my_tib4[,1:2])
class(my_tib4[,1])

class(my_tib4[[2]])
class(my_tib4$x)
# use [[ or $ to extrat a single column

# tibbles are more strict with $ (more frugal? hehe)
my_df5=data.frame(abc=1)
my_df5$a

my_tib5=tibble(abc=1)
my_tib5$a


# ---- other things to watch out for ----

# some functions written pre-tidyverse revolution don't allow tibbles as inputs
my_new_tib5=as.data.frame(my_tib5)
class(my_tib5)
class(my_new_tib5)

# do you know of some functions that don't work with tibbles?


