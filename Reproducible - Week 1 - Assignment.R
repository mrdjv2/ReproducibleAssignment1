payments<-read.csv("payments.csv")

relevant_data<-cbind(data.frame(payments$Average.Covered.Charges), data.frame(payments$Average.Total.Payments), data.frame(payments$DRG.Definition), data.frame(payments$Provider.State))
colnames(relevant_data)<-c("Average.Covered.Charges", "Average.Total.Payments", "DRG.Definition", "Provider.State")

#plot(relevant_data$Average.Covered.Charges, relevant_data$Average.Total.Payments)

definitions<-list(unique(relevant_data$DRG.Definition))
states<-list(unique(relevant_data$Provider.State))

#mfrow(6,6)

for(definition in definitions[[1]]){
        for(state in states[[1]]){
                temp<-subset(relevant_data, relevant_data$DRG.Definition == definition & relevant_data$Provider.State == state)
                plot(temp$Average.Covered.Charges, temp$Average.Total.Payments, main = paste(state , " " , definition))
        }
}