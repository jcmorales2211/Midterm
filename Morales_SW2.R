data<-read.csv('midetrmseatwork_data.csv')

Meanfunction<-function(datas, removeNA =TRUE)
{
  col_num<-ncol(data)
  means_per_col<-numeric(col_num)
  for(element in 1:col_num){
    means_per_col[element]<- mean(data[ , element],na.rm = removeNA)
  }
  means_per_col
}

Meanfunction(data, TRUE)

#Task1
  subs<- function(data,min,max){
    param <- ifelse(data$Ozone>min & data$Temp>max,data$Wind,NA)
    mean(param,na.rm = TRUE)
  }
subs(data,25,70)

#Task2
Meanfunction <- function(data,Month,Day){
  x <- 0
  for (row in 1:nrow(data)) {
    x[row]<- ifelse(data[row,5]==Month & data[row,6]==Day,data[row,4],NA)
  }
  mean(x,na.rm = TRUE)
}

Meanfunction(data,9,8)

#Task 3
MinFunction <- function(data,Month){
  x <- 0
  for (row in 1:nrow(data)) {
    y[row]<- ifelse(data[row,5]==Month,data[row,1],NA)
  }
  min(y,na.rm = TRUE)
}
MinFunction(data,5)
MinFunction(data,6)
MinFunction(data,7)
MinFunction(data,8)
MinFunction(data,9)
