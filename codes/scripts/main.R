
#load the required packages.
#If these packages are not installed, use installed.packages("package_name") to install them  

library(ggplot2)
library(patchwork)
library(reshape2 )
library(ggpubr)
library(ggthemes)
library(dplyr)
library(gtsummary)
### Install the required packages
# install.packages('googlesheets4')

### Load the required libraries
library(googlesheets4)

### you may need to run these first time for authentification in google sheet
#googlesheets4::gs4_deauth()
#googlesheets4::gs4_auth()

# load all functions
. <- lapply(list.files("R", full.names = TRUE), source)

data <- as.data.frame(read_sheet("https://docs.google.com/spreadsheets/d/1lV4Obpj49q17-UH9vshJ--v_ZwqFzKQ_bXNKWvqSi_8/edit?gid=877273254#gid=877273254"))


#subset the case notifications, and wastewater: 

sub_dat<-subset(data,data$`Source type` %in% c("Confirmed cases time series", "Wastewater","Deaths","Transmission pairs"))
sub_dat=sub_dat[,c(-1,-49)]
#analyse data for the main analysis in the manuscript, including the latex code for the table, see outputs folder:
analyse_data(sub_dat)

#do the same for the supplement figures: 
data_to_analyse=data[,c(-1,-49)]
analyse_data(data_to_analyse)

