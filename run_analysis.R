## test
library(data.table)
##step1
url1<-"/train/X_train.txt"
url2<-"/test/X_test.txt"
train<-read.table("C:/Users/895560/Desktop/Rwd/datagettingcleansing/Courseproject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",sep=".")
test<-read.table("C:/Users/895560/Desktop/Rwd/datagettingcleansing/Courseproject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",sep=".")
features<-read.table("C:/Users/895560/Desktop/Rwd/datagettingcleansing/Courseproject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt",sep="")
featuresT<-as.data.table(t(features))
featuresT2<-featuresT[2,]
featuresT2<-featuresT2[,V562:="ID"]
names(train)<-featuresT2[1,]
names(test)<-featuresT2[1,]
mergedata<-rbind(train,test)
##step 2
meanstd<-matchcols(mergedata, with=c("-mean","-std"),method="or")
MeanStd<-mergedata[,c(meanstd$"-mean",meanstd$"-std")]
##step 3
subjecttest<-read.table("C:/Users/895560/Desktop/Rwd/datagettingcleansing/Courseproject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
subjecttrain<-read.table("C:/Users/895560/Desktop/Rwd/datagettingcleansing/Courseproject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject<-rbind(subjecttrain,subjecttest)
names(subject)="subject"
MeanStd2<-cbind(MeanStd,subject)

