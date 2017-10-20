activity<-read.csv("activity.csv")
relevant_data<-na.omit(activity)
relevant_data[,2]<-as.Date(relevant_data$date)
relevant_data[,4]<-as.POSIXct(relevant_data$date)-2*60*60+relevant_data$interval

steps_per_time<-aggregate(relevant_data$steps, list(relevant_data$interval) , mean)
colnames(steps_per_time)<-c("interval", "steps")
plot(steps_per_time$interval, steps_per_time$steps, type="l")

#maximum activity
steps_per_time[which(steps_per_time$x==max(steps_per_time$x)),1]


#Number of missing values
dim(activity)[1]-dim(relevant_data)[1]

only_na<-activity[is.na(activity[,1]),]

#imputing with avg per interval

na_imputed<-merge(only_na, steps_per_time, by="interval")

na_imputed<-na_imputed[,c(1,3,4)]
colnames(na_imputed)<-c("interval", "date", "steps")

relevant_data_imputed<-rbind(na.omit(activity), na_imputed)



weekend<-c("Samstag", "Sonntag")

weekendday<-weekdays(relevant_data$date) %in% weekend

relevant_data[,5]<-weekendday
colnames(relevant_data)<-c("steps", "date", "interval", "date_time","weekend")

relevant_data_weekend<-subset(relevant_data, relevant_data$weekend == TRUE)
relevant_data_weekday<-subset(relevant_data, relevant_data$weekend == FALSE)

