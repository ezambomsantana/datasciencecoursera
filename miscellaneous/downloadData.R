#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(url , destfile = "teste.csv" )

data <- read.csv("teste.csv")

dataVal <- data[data$VAL %in% 24,]


library(xlsx)
rowIndex <- 18:23
colIndex <- 7:15
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url2 , destfile = "teste.xlsx" )
dat <- read.xlsx("teste2.xlsx", sheetIndex = 1 , colIndex = colIndex, rowIndex = rowIndex)

sum(dat$Zip*dat$Ext,na.rm=T)


library(XML)
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlInternalTreeParse(url)
rootNode <- xmlRoot(doc)
names(rootNode)

zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
table(zipcode == 21231)
