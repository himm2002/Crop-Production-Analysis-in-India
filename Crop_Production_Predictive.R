#Predictive Analysis -- Linear Regression Model

install.packages("readxl")
library(readxl)

df_1 <- read_xlsx("D://Business analytics//Unified_Mentor_Internship//Crop Production Analysis//Crop_Data_Numeric.xlsx")
head(df_1)
#as this is tibble data type we have to convert it into proper data frame
df_data <- as.data.frame(df_1)
head(df_data)
colSums(is.na(df_data))

#as we have null values in Production/Area Column we have to remove that null values from there
colSums(is.na(clean_data))
clean_data <- na.omit(df_data)

colSums(is.na(clean_data))

any(is.infinite(clean_data$`Production/Area`))

clean_data$`Production/Area`[is.infinite(clean_data$`Production/Area`)] <- 0

#now we are going to create the the regression model taking all the variables into consideration

regg_model <- lm(Production~.,data=clean_data)
summary(regg_model)
predicted_production <- predict(regg_model)

clean_data$predicted_production <- predicted_production
clean_data
#exporting the file for further dashboard development
write.csv(clean_data,file="crop_prediction_values.csv",row.names = FALSE)

