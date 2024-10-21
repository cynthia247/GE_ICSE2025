library(effsize)
graphics.off()
par(mfrow=c(2,2))
txtReadCSH = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/C#/TextReadability/Text_Readability_Score_GT_0.csv", header = T)
txtReadCSL = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/C#/TextReadability/Text_Readability_Score_LT_0.csv", header = T)
txtReadJH = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/Java/TextReadability/Text_Readability_Score_GT_0.csv", header = T)
txtReadJL = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/Java/TextReadability/Text_Readability_Score_LT_0.csv", header = T)
txtReadJSH = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/JavaScript/TextReadability/Text_Readability_Score_GT_0.csv", header = T)
txtReadJSL = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/JavaScript/TextReadability/Text_Readability_Score_LT_0.csv", header = T)
txtReadPyH = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/Python/TextReadability/Text_Readability_Score_GT_0.csv", header = T)
txtReadPyL = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/Python/TextReadability/Text_Readability_Score_LT_0.csv", header = T)
txtReadH = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/CombineResults/TextReadability/TextReadability_Score_GT_0.csv", header = T)
txtReadL = read.csv("E:/Projects/SOContentQualityResources/FeatureValues/TextOnly/CombineResults/TextReadability/TextReadability_Score_LT_0.csv", header = T)
#C-Sharp
readCSH = txtReadCSH$Score
readCSL = txtReadCSL$Score
summary(readCSH)
summary(readCSL)
wilcox.test(readCSH,readCSL)
cliff.delta(readCSH,readCSL)
#Java
readJH = txtReadJH$Score
readJL = txtReadJL$Score
summary(readJH)
summary(readJL)
#JavaScript
readJSH = txtReadJSH$Score
readJSL = txtReadJSL$Score
summary(readJSH)
summary(readJSL)
#Python
readPyH = txtReadPyH$Score
readPyL = txtReadPyL$Score
summary(readPyH)
summary(readPyL)
#Combile
readH = txtReadH$Score
readL = txtReadL$Score
summary(readH)
summary(readL)
#Random Sampled
#Plot : Boxplot
boxplot(readCSH, readCSL, readJH, readJL,readJSH,readJSL,readPyH,readPyL,readH,readL,
        at=c(1,2, 4,5, 7,8, 10,11, 13,14), xaxt="n", ylab="Readability", outline = F,cex.lab=1.3,
        col = c("white","gray","white","gray","white","gray","white","gray","white","gray"))
axis(side=1,at=c(1.5,4.5,7.5,10.5,13.5),  labels= c("C#","Java","JavaScript","Python","All"), cex.axis = 1.3)
abline(v=3, lty=2)
abline(v=6, lty=2)
abline(v=9, lty=2)
abline(v=12, lty=2)
legend(1,25,legend= c( "Promoted","Discouraged"), col=c("black","gray"), cex=1.5, pt.cex = 2.5, pch=c(0,15), box.col = "white", bg = "white")









