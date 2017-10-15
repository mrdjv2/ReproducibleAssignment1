payments<-read.csv("payments.csv")

relevant_data<-cbind(data.frame(payments$Average.Covered.Charges), data.frame(payments$Average.Total.Payments), data.frame(payments$DRG.Definition), data.frame(payments$Provider.State))
colnames(relevant_data)<-c("Average.Covered.Charges", "Average.Total.Payments", "DRG.Definition", "Provider.State")

plot(relevant_data$Average.Covered.Charges, relevant_data$Average.Total.Payments)