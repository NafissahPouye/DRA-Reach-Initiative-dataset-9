library(readxl)      # for read/write function for STATA files 
library(sdcMicro)    # sdcMicro package with functions for the SDC process 
library(tidyverse)   


setwd("C:/Users/LENOVO T46OS/Desktop/DRA-Reach-Initiative-datasets/DRA-Reach-Initiative-dataset-9")

data <- read_excel("data.xlsx")

#Convert variables into factors
data$'Q2'<-as.factor('Q2')
data$'Q3' <- as.factor('Q3')
data$'Q4' <- as.factor('Q4')
data$'Q5' <- as.factor('Q5')
data$'Q6' <- as.factor('Q6')
data$'Q7' <- as.factor('Q7')
data$'Q8' <- as.factor('Q8')
data$'Q9' <- as.factor('Q9')
data$'Q10' <- as.factor('Q10')
data$'Q11' <- as.factor('Q11')
data$'Q12' <- as.factor('Q12')
data$'Q13' <- as.factor('Q13')
data$'Q14' <- as.factor('Q14')
data$'Q15' <- as.factor('Q15')
data$'Q35' <- as.factor('Q35')
data$'Q36' <- as.factor('Q36')
data$'Q37' <- as.factor('Q37')
data$'Q38' <- as.factor('Q38')
data$'Q39' <- as.factor('Q39')
data$'Q40' <- as.factor('Q40')
data$'Q41' <- as.factor('Q41')
data$'Q42' <- as.factor('Q42')
selectedKeyVars <- c('Q2','Q2',	'Q3',	'Q4',	'Q5',	'Q6',	'Q7', 'Q8', 'Q9', 'Q10', 'Q11', 'Q12', 'Q13', 'Q14', 'Q15', 'Q35', 'Q36', 'Q37', 'Q38', 'Q39', 'Q40', 'Q41', 'Q42' )

fileRes<-data[,selectedKeyVars]

# Convert the sub file into dataframe
fileRes <- as.data.frame(fileRes)

#Assess the disclosure risk
objSDC <- createSdcObj(dat = fileRes, keyVars = selectedKeyVars)

#Disclosure risk assessment 
print(objSDC, "risk")

#Generating an internal (extensive) report
report(objSDC, filename = "index", internal = TRUE) 

