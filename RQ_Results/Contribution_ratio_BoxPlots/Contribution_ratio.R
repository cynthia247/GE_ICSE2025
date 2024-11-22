library(effsize)
library(lattice)

graphics.off()
par(mfrow=c(2,1))

data=read.csv("Conceptualization_ratio.csv", header = T)

#--------------------Conceptualization------------------------#

conceptualization_female = data$Female.Conceptualization.Ratio
conceptualization_female <- conceptualization_female[!is.na(conceptualization_female) & !is.nan(conceptualization_female)]

Q1 = quantile(conceptualization_female, 0.25)
Q3 = quantile(conceptualization_female, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
conceptualization_female <- conceptualization_female[conceptualization_female >= lower_bound & conceptualization_female <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(conceptualization_female)



conceptualization_male = data$Male.Conceptualization.Ratio
conceptualization_male <- conceptualization_male[!is.na(conceptualization_male) & !is.nan(conceptualization_male)]

Q1 = quantile(conceptualization_male, 0.25)
Q3 = quantile(conceptualization_male, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
conceptualization_male <- conceptualization_male[conceptualization_male >= lower_bound & conceptualization_male <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(conceptualization_male)

#wilcox.test(delayVio, delayNonVio)

wilcox.test(conceptualization_female, conceptualization_male)

cliff.delta(conceptualization_female, conceptualization_male)

mean_conceptualization_female <- mean(conceptualization_female)
mean_conceptualization_male <- mean(conceptualization_male)



#--------------------Data Curation------------------------#

dataCuration_female = data$Female.Data_Curation.Ratio
dataCuration_female <- dataCuration_female[!is.na(dataCuration_female) & !is.nan(dataCuration_female)]

Q1 = quantile(dataCuration_female, 0.25)
Q3 = quantile(dataCuration_female, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
dataCuration_female <- dataCuration_female[dataCuration_female >= lower_bound & dataCuration_female <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(dataCuration_female)



dataCuration_male = data$Male.Data_Curation.Ratio
dataCuration_male <- dataCuration_male[!is.na(dataCuration_male) & !is.nan(dataCuration_male)]

Q1 = quantile(dataCuration_male, 0.25)
Q3 = quantile(dataCuration_male, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
dataCuration_male <- dataCuration_male[dataCuration_male >= lower_bound & dataCuration_male <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(dataCuration_male)

#wilcox.test(delayVio, delayNonVio)

wilcox.test(dataCuration_female, dataCuration_male)

cliff.delta(dataCuration_female, dataCuration_male)

mean_dataCuration_female <- mean(dataCuration_female)
mean_dataCuration_male <- mean(dataCuration_male)


#--------------------Formal Analysis------------------------#
formalAnalysis_female = data$Female.Formal_Analysis.Ratio
formalAnalysis_female <- formalAnalysis_female[!is.na(formalAnalysis_female) & !is.nan(formalAnalysis_female)]

Q1 = quantile(formalAnalysis_female, 0.25)
Q3 = quantile(formalAnalysis_female, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
formalAnalysis_female <- formalAnalysis_female[formalAnalysis_female >= lower_bound & formalAnalysis_female <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(formalAnalysis_female)



formalAnalysis_male = data$Male.Formal_Analysis.Ratio
formalAnalysis_male <- formalAnalysis_male[!is.na(formalAnalysis_male) & !is.nan(formalAnalysis_male)]

Q1 = quantile(formalAnalysis_male, 0.25)
Q3 = quantile(formalAnalysis_male, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
formalAnalysis_male <- formalAnalysis_male[formalAnalysis_male >= lower_bound & formalAnalysis_male <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(formalAnalysis_male)

wilcox.test(formalAnalysis_female, formalAnalysis_male)

cliff.delta(formalAnalysis_female, formalAnalysis_male)

mean_formalAnalysis_female <- mean(formalAnalysis_female)
mean_formalAnalysis_male <- mean(formalAnalysis_male)

#--------------------Funding Acquisition------------------------#

# fundingAcquisition_female = data$Female.Funding.Acquisition.Ratio
# fundingAcquisition_female <- fundingAcquisition_female[!is.na(fundingAcquisition_female) & !is.nan(fundingAcquisition_female)]
# 
# Q1 = quantile(fundingAcquisition_female, 0.25)
# Q3 = quantile(fundingAcquisition_female, 0.75)
# IQR = Q3 - Q1
# 
# # Define lower and upper bounds
# lower_bound <- Q1 - 1.5 * IQR
# upper_bound <- Q3 + 1.5 * IQR
# 
# # Remove outliers
# fundingAcquisition_female <- fundingAcquisition_female[fundingAcquisition_female >= lower_bound & fundingAcquisition_female <= upper_bound]
# 
# # Summary of AccIdVio after removing outliers
# summary(fundingAcquisition_female)
# 
# 
# 
# fundingAcquisition_male = data$Male.Funding.Acquisition.Ratio
# fundingAcquisition_male <- fundingAcquisition_male[!is.na(fundingAcquisition_male) & !is.nan(fundingAcquisition_male)]
# 
# Q1 = quantile(fundingAcquisition_male, 0.25)
# Q3 = quantile(fundingAcquisition_male, 0.75)
# IQR = Q3 - Q1
# 
# # Define lower and upper bounds
# lower_bound <- Q1 - 1.5 * IQR
# upper_bound <- Q3 + 1.5 * IQR
# 
# # Remove outliers
# fundingAcquisition_male <- fundingAcquisition_male[fundingAcquisition_male >= lower_bound & fundingAcquisition_male <= upper_bound]
# 
# # Summary of AccIdVio after removing outliers
# summary(fundingAcquisition_male)
# 
# wilcox.test(fundingAcquisition_female, fundingAcquisition_male)
# 
# cliff.delta(fundingAcquisition_female, fundingAcquisition_male)
# 
# mean_fundingAcquisition_female <- mean(fundingAcquisition_female)
# mean_fundingAcquisition_male <- mean(fundingAcquisition_male)


#--------------------Investigation------------------------#

investigation_female = data$Female.Investigation.Ratio
investigation_female <- investigation_female[!is.na(investigation_female) & !is.nan(investigation_female)]

Q1 = quantile(investigation_female, 0.25)
Q3 = quantile(investigation_female, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
investigation_female <- investigation_female[investigation_female >= lower_bound & investigation_female <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(investigation_female)



investigation_male = data$Male.Investigation.Ratio
investigation_male <- investigation_male[!is.na(investigation_male) & !is.nan(investigation_male)]

Q1 = quantile(investigation_male, 0.25)
Q3 = quantile(investigation_male, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
investigation_male <- investigation_male[investigation_male >= lower_bound & investigation_male <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(investigation_male)

wilcox.test(investigation_female, investigation_male)

cliff.delta(investigation_female, investigation_male)

mean_investigation_female <- mean(investigation_female)
mean_investigation_male <- mean(investigation_male)

#--------------------Methodology------------------------#

methodology_female = data$Female.Methodology.Ratio
methodology_female <- methodology_female[!is.na(methodology_female) & !is.nan(methodology_female)]

Q1 = quantile(methodology_female, 0.25)
Q3 = quantile(methodology_female, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
methodology_female <- methodology_female[methodology_female >= lower_bound & methodology_female <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(methodology_female)



methodology_male = data$Male.Methodology.Ratio
methodology_male <- methodology_male[!is.na(methodology_male) & !is.nan(methodology_male)]

Q1 = quantile(methodology_male, 0.25)
Q3 = quantile(methodology_male, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
methodology_male <- methodology_male[methodology_male >= lower_bound & methodology_male <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(methodology_male)

wilcox.test(methodology_female, methodology_male)

cliff.delta(methodology_female, methodology_male)

mean_methodology_female <- mean(methodology_female)
mean_methodology_male <- mean(methodology_male)

#--------------------Project Administration------------------------#

projectAdministration_female = data$Female.Project.Administration.Ratio
projectAdministration_female <- projectAdministration_female[!is.na(projectAdministration_female) & !is.nan(projectAdministration_female)]

Q1 = quantile(projectAdministration_female, 0.25)
Q3 = quantile(projectAdministration_female, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
projectAdministration_female <- projectAdministration_female[projectAdministration_female >= lower_bound & projectAdministration_female <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(projectAdministration_female)



projectAdministration_male = data$Male.Project.Administration.Ratio
projectAdministration_male <- projectAdministration_male[!is.na(projectAdministration_male) & !is.nan(projectAdministration_male)]

Q1 = quantile(projectAdministration_male, 0.25)
Q3 = quantile(projectAdministration_male, 0.75)
IQR = Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

# Remove outliers
projectAdministration_male <- projectAdministration_male[projectAdministration_male >= lower_bound & projectAdministration_male <= upper_bound]

# Summary of AccIdVio after removing outliers
summary(projectAdministration_male)

wilcox.test(projectAdministration_female, projectAdministration_male)

cliff.delta(projectAdministration_female, projectAdministration_male)

mean_projectAdministration_female <- mean(projectAdministration_female)
mean_projectAdministration_male <- mean(projectAdministration_male)

#--------------------Resources------------------------#

# resources_female = data$Female.Resources.Ratio
# resources_female <- resources_female[!is.na(resources_female) & !is.nan(resources_female)]
# 
# Q1 = quantile(resources_female, 0.25)
# Q3 = quantile(resources_female, 0.75)
# IQR = Q3 - Q1
# 
# # Define lower and upper bounds
# lower_bound <- Q1 - 1.5 * IQR
# upper_bound <- Q3 + 1.5 * IQR
# 
# # Remove outliers
# # resources_female <- resources_female[resources_female >= lower_bound & resources_female <= upper_bound]
# 
# # Summary of AccIdVio after removing outliers
# summary(resources_female)
# 
# 
# 
# resources_male = data$Male.Resources.Ratio
# resources_male <- resources_male[!is.na(resources_male) & !is.nan(resources_male)]
# 
# Q1 = quantile(resources_male, 0.25)
# Q3 = quantile(resources_male, 0.75)
# IQR = Q3 - Q1
# 
# # Define lower and upper bounds
# lower_bound <- Q1 - 1.5 * IQR
# upper_bound <- Q3 + 1.5 * IQR
# 
# # Remove outliers
# resources_male <- resources_male[resources_male >= lower_bound & resources_male <= upper_bound]
# 
# # Summary of AccIdVio after removing outliers
# summary(resources_male)
# 
# wilcox.test(resources_female, resources_male)
# 
# cliff.delta(resources_female, resources_male)
# 
# mean_resources_female <- mean(resources_female)
# mean_resources_male <- mean(resources_male)

#--------------------Software------------------------#

# Software
software_female = data$Female.Software.Ratio
software_female <- software_female[!is.na(software_female) & !is.nan(software_female)]

Q1 = quantile(software_female, 0.25)
Q3 = quantile(software_female, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

software_female <- software_female[software_female >= lower_bound & software_female <= upper_bound]

summary(software_female)

software_male = data$Male.Software.Ratio
software_male <- software_male[!is.na(software_male) & !is.nan(software_male)]

Q1 = quantile(software_male, 0.25)
Q3 = quantile(software_male, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

software_male <- software_male[software_male >= lower_bound & software_male <= upper_bound]

summary(software_male)

wilcox.test(software_female, software_male)
cliff.delta(software_female, software_male)

mean_software_female <- mean(software_female)
mean_software_male <- mean(software_male)


#--------------------Supervision------------------------#

# Supervision
supervision_female = data$Female.Supervision.Ratio
supervision_female <- supervision_female[!is.na(supervision_female) & !is.nan(supervision_female)]

Q1 = quantile(supervision_female, 0.25)
Q3 = quantile(supervision_female, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

supervision_female <- supervision_female[supervision_female >= lower_bound & supervision_female <= upper_bound]

summary(supervision_female)

supervision_male = data$Male.Supervision.Ratio
supervision_male <- supervision_male[!is.na(supervision_male) & !is.nan(supervision_male)]

Q1 = quantile(supervision_male, 0.25)
Q3 = quantile(supervision_male, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

supervision_male <- supervision_male[supervision_male >= lower_bound & supervision_male <= upper_bound]

summary(supervision_male)

wilcox.test(supervision_female, supervision_male)
cliff.delta(supervision_female, supervision_male)

mean_supervision_female <- mean(supervision_female)
mean_supervision_male <- mean(supervision_male)

#--------------------Validation------------------------#
# Validation
validation_female = data$Female.Validation.Ratio
validation_female <- validation_female[!is.na(validation_female) & !is.nan(validation_female)]

Q1 = quantile(validation_female, 0.25)
Q3 = quantile(validation_female, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

validation_female <- validation_female[validation_female >= lower_bound & validation_female <= upper_bound]

summary(validation_female)

validation_male = data$Male.Validation.Ratio
validation_male <- validation_male[!is.na(validation_male) & !is.nan(validation_male)]

Q1 = quantile(validation_male, 0.25)
Q3 = quantile(validation_male, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

validation_male <- validation_male[validation_male >= lower_bound & validation_male <= upper_bound]

summary(validation_male)

wilcox.test(validation_female, validation_male)
cliff.delta(validation_female, validation_male)

mean_validation_female <- mean(validation_female)
mean_validation_male <- mean(validation_male)

#--------------------Visualization------------------------#

# Visualization
visualization_female = data$Female.Visualization.Ratio
visualization_female <- visualization_female[!is.na(visualization_female) & !is.nan(visualization_female)]

Q1 = quantile(visualization_female, 0.25)
Q3 = quantile(visualization_female, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

visualization_female <- visualization_female[visualization_female >= lower_bound & visualization_female <= upper_bound]

summary(visualization_female)

visualization_male = data$Male.Visualization.Ratio
visualization_male <- visualization_male[!is.na(visualization_male) & !is.nan(visualization_male)]

Q1 = quantile(visualization_male, 0.25)
Q3 = quantile(visualization_male, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

visualization_male <- visualization_male[visualization_male >= lower_bound & visualization_male <= upper_bound]

summary(visualization_male)

wilcox.test(visualization_female, visualization_male)
cliff.delta(visualization_female, visualization_male)

mean_visualization_female <- mean(visualization_female)
mean_visualization_male <- mean(visualization_male)


#--------------------Writing-original draft------------------------#

# Writing-original draft
writing_original_female = data$Female.Writing.â...Original.Draft.Ratio
writing_original_female <- writing_original_female[!is.na(writing_original_female) & !is.nan(writing_original_female)]

Q1 = quantile(writing_original_female, 0.25)
Q3 = quantile(writing_original_female, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

writing_original_female <- writing_original_female[writing_original_female >= lower_bound & writing_original_female <= upper_bound]

summary(writing_original_female)

writing_original_male = data$Male.Writing.â...Original.Draft.Ratio
writing_original_male <- writing_original_male[!is.na(writing_original_male) & !is.nan(writing_original_male)]

Q1 = quantile(writing_original_male, 0.25)
Q3 = quantile(writing_original_male, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

writing_original_male <- writing_original_male[writing_original_male >= lower_bound & writing_original_male <= upper_bound]

summary(writing_original_male)

wilcox.test(writing_original_female, writing_original_male)
cliff.delta(writing_original_female, writing_original_male)

mean_writing_original_female <- mean(writing_original_female)
mean_writing_original_male <- mean(writing_original_male)

#--------------------Writing-review&editing------------------------#

# Writing-original draft
writing_review_female = data$Female.Writing.â...Review...Editing.Ratio
writing_review_female <- writing_review_female[!is.na(writing_review_female) & !is.nan(writing_review_female)]

Q1 = quantile(writing_review_female, 0.25)
Q3 = quantile(writing_review_female, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

writing_review_female <- writing_review_female[writing_review_female >= lower_bound & writing_review_female <= upper_bound]

summary(writing_review_female)

writing_review_male = data$Male.Writing.â...Review...Editing.Ratio
writing_review_male <- writing_review_male[!is.na(writing_review_male) & !is.nan(writing_review_male)]

Q1 = quantile(writing_review_male, 0.25)
Q3 = quantile(writing_review_male, 0.75)
IQR = Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

writing_review_male <- writing_review_male[writing_review_male >= lower_bound & writing_review_male <= upper_bound]

summary(writing_review_male)

wilcox.test(writing_review_female, writing_review_male)
cliff.delta(writing_review_female, writing_review_male)

mean_writing_review_female <- mean(writing_review_female)
mean_writing_review_male <- mean(writing_review_male)

boxplot(conceptualization_female, conceptualization_male, dataCuration_female, dataCuration_male,formalAnalysis_female, formalAnalysis_male, investigation_female, investigation_male, methodology_female, methodology_male,projectAdministration_female, projectAdministration_male,
        at=c(1,2, 4,5, 7,8, 10,11, 13,14, 16,17), xaxt="n", ylab="Contribution Ratio", outline = F,cex.lab=0.9,
        col = c("white","gray", "white","gray", "white","gray", "white","gray", "white","gray", "white","gray"))
axis(side=1,at=c(1.5,4.5, 7.5, 10.5, 13.5, 16.5),  labels= c("Conceptualization", "Data Curation", "Formal Analysis", "Investigation", "Methodology", "Project Administration"), cex.axis = 0.75)

abline(v=3, lty=2)
abline(v=6, lty=2)
abline(v=9, lty=2)
abline(v=12, lty=2)
abline(v=15, lty=2)



points(c(1, 2,4,5,7,8, 10,11, 13,14, 16,17), c(mean_conceptualization_female, mean_conceptualization_male, mean_dataCuration_female, mean_dataCuration_male, mean_formalAnalysis_female, mean_formalAnalysis_male, mean_investigation_female, mean_investigation_male, mean_methodology_female, mean_methodology_male, mean_projectAdministration_female, mean_projectAdministration_male), col = "black", pch = 19)

text(x = c(1, 2, 4,5,7,8, 10,11, 13,14, 16,17), y = c(mean_conceptualization_female, mean_conceptualization_male, mean_dataCuration_female, mean_dataCuration_male, mean_formalAnalysis_female, mean_formalAnalysis_male, mean_investigation_female, mean_investigation_male, mean_methodology_female, mean_methodology_male, mean_projectAdministration_female, mean_projectAdministration_male), 
     labels = paste(round(c(mean_conceptualization_female, mean_conceptualization_male, mean_dataCuration_female, mean_dataCuration_male, mean_formalAnalysis_female, mean_formalAnalysis_male, mean_investigation_female, mean_investigation_male, mean_methodology_female, mean_methodology_male, mean_projectAdministration_female, mean_projectAdministration_male), 2)), 
     pos = 3, 
     cex=0.80,
     col = "black")

legend("topright", 
       legend = c("Female", "Male"), 
       col = c("black", "gray"), 
       cex = 0.7,               # Text size
       pt.cex = 0.8,             # Point size
       pch = c(0, 15),           # Symbols for Female and Male
       x.intersp = 0.5,         # Horizontal space between legend text and symbols
       y.intersp = 0.75,          # Vertical space between legend items
       box.col = "black",        # Box color
       bg = "white")             



boxplot(software_female, software_male, supervision_female, supervision_male, validation_female, validation_male, visualization_female, visualization_male, writing_original_female, writing_original_male, writing_review_female, writing_review_male,
        at=c(1,2, 4,5, 7,8, 10,11, 13,14, 16,17), xaxt="n", ylab="Contribution Ratio", outline = F,cex.lab=0.9,
        col = c("white","gray", "white","gray", "white","gray", "white","gray", "white","gray", "white","gray"))
axis(side=1,at=c(1.5,4.5, 7.5, 10.5, 13.5, 16.5),  labels= c("Software", "Supervision", "Validation", "Visualization", "Writing - original draft", "Writing - review & editing"), cex.axis = 0.75)

abline(v=3, lty=2)
abline(v=6, lty=2)
abline(v=9, lty=2)
abline(v=12, lty=2)
abline(v=15, lty=2)




# Annotate the mean values
points(c(1, 2,4,5,7,8, 10,11, 13,14, 16,17), c(mean_software_female, mean_software_male, mean_supervision_female, mean_supervision_male, mean_validation_female, mean_validation_male, mean_visualization_female, mean_visualization_male, mean_writing_original_female, mean_writing_original_male, mean_writing_review_female, mean_writing_review_male), col = "black", pch = 19)

# Annotate the mean values
text(x = c(1, 2, 4,5,7,8, 10,11, 13,14, 16,17), 
     y = c(mean_software_female, mean_software_male, mean_supervision_female, mean_supervision_male, mean_validation_female, mean_validation_male, mean_visualization_female, mean_visualization_male, mean_writing_original_female, mean_writing_original_male, mean_writing_review_female, mean_writing_review_male+0.04), 
     labels = paste(round(c( mean_software_female, mean_software_male, mean_supervision_female, mean_supervision_male, mean_validation_female, mean_validation_male, mean_visualization_female, mean_visualization_male, mean_writing_original_female, mean_writing_original_male, mean_writing_review_female, mean_writing_review_male), 2)), 
     pos = 3, 
     cex=0.80,
     col = "black")


#legend("topright",legend= c( "Female","Male"), col=c("black","gray"), cex=0.75, pt.cex = 1.00, pch=c(0,15), x.intersp = 0.5, box.col = "white", bg = "white")
