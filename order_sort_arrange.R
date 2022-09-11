# compare order() base R 
# vs arrange() from dplyr

# BASE R approach =============================
# lets look at mtcars dataset
mtcars

# variables in mtcars
names(mtcars)

# create list of variables to keep
keepvars <- c("mpg", "cyl", "disp", "hp")

# base R way of selecting columns (with keepvars)
# and also select a subset of rows 1:10
mt1 <- mtcars[1:10 , keepvars]
mt1

# order() from base R
# returns the "index" of the 
# order if sorted from smallest to largest
order(mt1$hp)
# order if sorted decreasing
order(mt1$hp, decreasing = TRUE)

# also see sort.list() - pretty much same as order()
sort.list(mt1$hp)

# to see the final sorted vector and NOT the index
# see sort() in base R
# the default is ascending
sort(mt1$hp)
sort(mt1$hp, decreasing = TRUE)

# but you need to use order() as the INDEX for the row
# order to get the final sorted data.frame
# use order() to "arrange" the rows
# from smallest to largest in mt1 by hp
mt1[order(mt1$hp), ]
# if decreasing
mt1[order(mt1$hp, decreasing = TRUE), ]

# DPLYR R approach ============================
# note: dplyr::slice() allows you to pick specific rows
# base on row number, 
# see https://dplyr.tidyverse.org/reference/slice.html
library(dplyr)
mtcars %>%
  select(mpg, cyl, disp, hp) %>%
  slice(1:10) %>%
  arrange(hp)
# if decreasing
mtcars %>%
  select(mpg, cyl, disp, hp) %>%
  slice(1:10) %>%
  arrange(desc(hp))
