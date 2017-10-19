activity<-read.csv("activity.csv")
relevant_data<-na.omit(activity)
relevant_data[,2]<-as.Date(relevant_data$date)
relevant_data[,4]<-as.POSIXct(relevant_data$date)-2*60*60+relevant_data$interval

steps_per_time<-aggregate(relevant_data$steps, list(relevant_data$interval) , mean)
plot(steps_per_time$Group.1, steps_per_time$x, type="l")