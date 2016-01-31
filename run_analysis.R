## Coursera Cleaning Data assignment
## Michael Mikhailidi, 2016

## Script uses experimental data 
## from  Center for Machine Learning  and Intelligent Systems
## University of California, Irving (here and after UCI)
## Project: Human Activity Recognition Using  Smartphone
## Original Data Set  page is: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis<-function(...)   {
  ## Constants
  SDF <-"./UCI\ HAR\ Dataset"
  FSP <- .Platform$file.sep
  
  ## Requires dplyr library to calculate average activity
  require(dplyr)
  
  ## Obtain data from project archive
  get_data<-function() {
    # Delete existing folder 'UCI HAR Dataset'
    unlink("UCI HAR Dataset",recursive = T)
    
    # Script uses direct link to download and unpac data archive using URL:
    # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
     tfile <- tempfile()
    # Check platfoerm to handle HTTPs protocol properly
     dmethod <- switch(Sys.info()["sysname"], Linux="curl", Windows="wininet")
     download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                tfile, quiet=T,method = dmethod);
     
    # unpack to working directory. 
    unzip(tfile,overwrite = T)
    # Drop downloaded archive
    unlink(tfile)
    message("Source data has been prepared for analysis.");
  }  
  
  # Merges two data frames by keys and preserves orginal row order  
  # inspired by Tal Galili 
  # http://www.r-statistics.com/2012/01/merging-two-data-frame-objects-while-preserving-the-rows-order/
  
  safe_merge <- function(x,y,...) {
    sx <- data.frame(x,sID = 1:nrow(x))
    mrg <- merge(sx,y,...,sort = FALSE)
    ord <-order(mrg$sID)
    mrg[ord,colnames(mrg) !="sID"]
  }

  ## Prepare dictionary objects
  
  read_headers <- function() {
    
    fnm<-read.table(paste(SDF,"features.txt",sep = FSP),stringsAsFactors = F)
    
    # Read only -mean()- variables
    fnm[grep("-mean()-",fnm$V2, fixed = T),3] <-"numeric"
    # Read only -std()- variables
    fnm[grep("-std()-",fnm$V2, fixed = T),3] <-"numeric"
    # Skip all other variables
    fnm[is.na(fnm$V3),3] <- "NULL"
    
    # Tailor feature name for variable name
    fnm$V2 <- sub("-mean()-",".avg.",fnm$V2,fixed =  T)
    fnm$V2 <- sub("-std()-",".std.",fnm$V2,fixed =  T)
    
    # Set proper variable names
    names(fnm)<- c("id","feature","class")
    
    
    # Return variable names
    fnm
  }
  
  ## Denormalize data from data files
  denorm_data <- function(dset) {
    
    # Read  subject data and combine with activity names
    ydata <- cbind(read.table(paste(SDF,dset,paste("subject","_",dset,".txt",sep=""),sep = FSP),
                               col.names="Subject"),toupper(dset),
                    safe_merge(read.table(paste(SDF,dset,paste("y","_",dset,".txt",sep=""),sep = FSP),
                                    col.names="activity_id"),
                         alabels,by.x="activity_id",by.y="id")[,"activity"]
                    )
    # Fix variable names 
    names(ydata) <- c("subject","data.set","activity")
    
    # Read main variables using feature names nad classes 
    xdata <- read.table(paste(SDF,dset,paste("X","_",dset,".txt",sep=""),sep = FSP),
                        colClasses = fnames$class, col.names = fnames$feature)
    
    # Combine sublect, activity and measurements 
    cbind(ydata,xdata)
  }
  
  
  ## Load and unpack data
   get_data()
  
  
  # Read activity lables
  alabels <- read.table(paste(SDF,"activity_labels.txt",sep = FSP),
                         col.names=c("id","activity"))
  
  # Prepare column names and clasess 
  fnames <<-read_headers()
  
  ## Instantinate  combined result for both data sets
  activitydata <<- rbind(
    # Denormalize test data set    
    denorm_data("test"),
    ## Denormalize training data set
    denorm_data("train")
  )
  ## Produce average by subject and activity
  
  activitybysubject <<- select(activitydata,-data.set) %>% 
              group_by(subject,activity) %>% 
                     summarize_each(funs(mean))
  
  ## Remove raw data
   unlink(SDF)
}
