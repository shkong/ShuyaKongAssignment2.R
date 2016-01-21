### Assignment 2 ###
### Begin R Script ###

# 0.identifying information
ShuyaKongAssignment2 <- list(
firstName = "Shuya",
lastName = "Kong",
email = "shkong@ucsc.edu",
studentID = "1505077"
)


# 1.
diamonds <- get(
  load(
    file = url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/diamonds.RData")
  )
)

ShuyaKongAssignment2$s1a <- nrow(diamonds)
ShuyaKongAssignment2$s1b <- ncol(diamonds)
ShuyaKongAssignment2$s1c <- names(diamonds)
ShuyaKongAssignment2$s1d <- summary(diamonds$prices)

save(ShuyaKongAssignment2,
     file = "ShuyaKongAssignment2.RData")

#2.
df<- read.table(
  file = "https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt",
  sep = "\t",
  header = T
)

# a through e
ShuyaKongAssignment2$s2a <- nrow(df)
ShuyaKongAssignment2$s2b <- ncol(df)
ShuyaKongAssignment2$s2c <- names(df)
ShuyaKongAssignment2$s2d <- mean(df$weight)
ShuyaKongAssignment2$s2e <- median(df$weight)

#graph
hist(df$weight)
table(df$weight)

# new column
df$adjweight <- ifelse(test = df$weight<966,
                       yes = df$weight,
                       no = NA)

# f through i
ShuyaKongAssignment2$s2f <- mean(df$adjweight)
ShuyaKongAssignment2$s2g <- median(df$adjweight)
ShuyaKongAssignment2$s2h <- summary(df$weight,df$SEX==1) ## but i got length 6 instead of 7
ShuyaKongAssignment2$s2i <- summary(df$weight,df$SEX==2)

#3.

vec <- c(letters, LETTERS)
# extracting even index values
ShuyaKongAssignment2$s3a <- vec[c(FALSE,TRUE)]

# extract first three letter of my name
ShuyaKongAssignment2$s3b <- paste(vec[c(45,8,21)], collapse="")

arr <- array(c(letters, LETTERS),dim = c(3,3,3))
# extract first column from the second matrix
ShuyaKongAssignment2$s3c <- arr[,1,2]

# extract middle values
ShuyaKongAssignment2$s3d <- paste(arr[2,2,1],arr[2,2,2],arr[2,2,3], sep = " ")

# extract first three letters of my name
ShuyaKongAssignment2$s3e <- paste(arr[1,1,3],arr[2,3,1],arr[3,1,3], sep = "")


# 4.
library(foreign)
org_example <- read.dta("D:/RStudio/Rdata/org_example.dta")
sort(unique(org_example$year))
sort(unique(org_example$month))
sort(unique(org_example$educ))

ShuyaKongAssignment2$s4 <- aggregate(org_example$rw,by = list(org_example$year,org_example$month,org_example$educ),FUN = mean,simplify = TRUE, na.action=na.omit)

save(ShuyaKongAssignment2,
     file = "ShuyaKongAssignment2.RData")
### End R Script ###

