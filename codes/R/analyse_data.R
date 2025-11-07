
analyse_data<-function(sub_dat){
#clean the data to make some of the terms consistent with all the responses:
  sub_dat$`Stratification/covariates (except spatial-temporal see Resolution section)`[sub_dat$`Stratification/covariates (except spatial-temporal see Resolution section)`=="NO"]="None"
  sub_dat$`Stratification/covariates (except spatial-temporal see Resolution section)`[sub_dat$`Stratification/covariates (except spatial-temporal see Resolution section)`=="None,"]="None"
  
  sub_dat$`Target population`[sub_dat$`Target population`=="All the population"]="Whole population"
  sub_dat$`Target population`[sub_dat$`Target population`=="Whole population, sometimes specific e.g., to student or military populations"]="Whole population"
  sub_dat$`Primary purpose`[sub_dat$`Primary purpose`!="Clinical management"]="Other"
  
  sub_dat$`Time period covered`[sub_dat$`Time period covered`=="all the time"]="Continuous"
  sub_dat$`Collection frequency`[sub_dat$`Collection frequency`=="Multiple times a week"]="Multiple times \n a week"
  sub_dat$`Reporting frequency`[sub_dat$`Reporting frequency`=="Multiple times a week"]="Multiple times \n a week"
  names(sub_dat)[names(sub_dat) == 'Stratification/covariates (except spatial-temporal see Resolution section)'] <- 'Stratification'
  sub_dat$`Target population`[sub_dat$`Target population`=="Geographic structure"]="Geographic \n structure"
  sub_dat$Stratification[sub_dat$Stratification=="Demographic, Clinical"]= "Demographic, \n Clinical"
  sub_dat$`Study design`[  sub_dat$`Study design`=="Contact tracing data"]="Contact tracing"
  sub_dat$`Study design`[ sub_dat$`Study design`=="prospective contact tracing"]="Contact tracing"
 # sub_dat$`Target population`[sub_dat$`Target population`=="Convenience"]="Other"
  #sub_dat$`Target population`[sub_dat$`Target population`=="Healthcare workers"]="Other"
  #sub_dat$`Target population`[sub_dat$`Target population`=="Risk-specific"]="Other"
#  sub_dat$`Target population`[sub_dat$`Target population`=="Specific age groups, Risk-specific, Convenience"]="Other"
  
 # sub_dat$`Target population`= factor(sub_dat$`Target population`,levels=c("Whole population","Geographic structure","Geographic structure, Whole population","Other"))
#add the main components:
components<-c("Basic meta-data","Scope","Resolution","Data quality","Data utility","Practical considerations")

comp_dat<-c(rep(components[1],4),rep(components[2],5),rep(components[3],8),rep(components[4],14),rep(components[5],3),rep(components[6],9))


#variables not used to make the summary table:
xx=c("Description","The source population",
     "Geographic coverage","Quality of case definitions",
     "If there is the potential for selection bias what kind",
     "Test sensitivity","Test specificity","Potential for unexplained variability",
     "Why can't the information on the target population be generalised to the general population",
     "Reporting delay","Outages","Censoring","Truncation",
     "Selection (ie unrepresentative relative to target population), including ascertainment bias/underreporting",
     "Time-varying",
     "Direction of bias","Relationship of target population to general population","Sustainability",
     "Cost","Accessibility","Linkage potential",
     "Data format",
     "What data sources if any have been linked to?",
     "Which pathogens if any could your answers be generalised to?",
     "How generalisable are these findings for other pathogens?"
)

#filter the data needed to make the summary table:
fil_dat<-sub_dat %>%
  select(-all_of(xx))


#to generate the figure with quantitative responses, get the relevant variables:
new_data<-data.frame(sub_dat$`Source type`,
                     sub_dat$`Geographic coverage`,
                     sub_dat$`Quality of case definitions`,
                     sub_dat$`Test sensitivity`,
                     sub_dat$`Test specificity`,
                     sub_dat$`Potential for unexplained variability`,
                     sub_dat$`Reporting delay`,
                     sub_dat$`Outages`,
                     sub_dat$`Censoring`,
                     sub_dat$`Truncation`,
                     sub_dat$`Selection (ie unrepresentative relative to target population), including ascertainment bias/underreporting`,
                     sub_dat$`Time-varying`,
                     sub_dat$`Direction of bias`,
                     sub_dat$`Relationship of target population to general population`,
                    # sub_dat$`Sustainability`,
                     #sub_dat$`Cost`,
                     sub_dat$`Accessibility`,
                     sub_dat$`Linkage potential`,
                     sub_dat$`Data format`,
                     sub_dat$`How generalisable are these findings for other pathogens?`)

#rename the variables so that they are suitable for the figure:
colnames(new_data)=c("Source type","Geographic coverage","Quality of case definitions",
                     "Test sensitivity","Test specificity","Potential for unexplained variability",
                     "Reporting delay","Outages","Censoring","Truncation",
                     "Selection \n (ie unrepresentative \n relative to target population)",
                     "Time-varying",
                     "Direction of bias","Relationship of target \n population to general population",
                     #"Sustainability",
                    # "Cost",
                     "Accessibility","Linkage potential",
                     "Data format",
                     "How generalisable are these \n findings for other pathogens?")

#add the main components:
components<-c("Basic meta-data","Reso- \n -lution","Data quality","Data \n utility","Practical \n considerations")
comp_dat<-rep(c(rep(components[2],1),rep(components[3],11),rep(components[4],1),
                rep(components[5],4)),each=nrow(new_data))

#long format
m_new_data<-melt(new_data,id="Source type")
m_new_data$comp_dat=comp_dat
m_new_data$comp_dat=factor(m_new_data$comp_dat,levels=components)

#get the means for the figure:
meanss<-new_data %>%
  group_by(`Source type`) %>%
  summarise(across(everything(), ~mean(.x, na.rm = TRUE)))
meanss                                              
#long fomrat:
m_mean=melt(meanss,id="Source type")
m_mean$comp_dat=rep(c(rep(components[2],1),rep(components[3],11),rep(components[4],1),rep(components[5],4)),each=nrow(meanss))

m_mean$comp_dat=factor(m_mean$comp_dat,levels=components)

#if the number of columns are greater than 5, then break the figures to two figures:
n_levles<-length(levels(as.factor(m_new_data$`Source type`)))

#make the data table: 
components<-c("Basic meta-data","Scope","Resolution","Data utility","Practical considerations")

nn<-nrow(fil_dat)

comp_dat<-c(rep(components[1],nn*2),rep(components[2],nn*4),rep(components[3],nn*7),
            rep(components[4],nn*7),rep(components[5],nn*1))


mfil_dat=melt(fil_dat,id="Source type")
mfil_dat$main_ch=comp_dat

#make the summary table 
tbl <- fil_dat %>%  tbl_summary(    by = `Source type`,    statistic = all_categorical() ~ "{p}%"  )

if(n_levles<=4){

  
  #generate the latex code and save it as a text file in the outputs folder
  latex_code<-as.character(as_gt(tbl) %>% gt::as_latex())
  sink(file = "outputs/latex_code_main_table.text")
  cat(latex_code)
  sink()
  
  
p1<-plot_data(m_new_data,m_mean)

ggsave("outputs/survey_responses.png",p1,height = 7,width = 12)

}
else{
  
  
  
  #generate the latex code and save it as a text file in the outputs folder
  latex_code<-as.character(as_gt(tbl) %>% gt::as_latex())
  sink(file = "outputs/latex_code_supplement_table.text")
  cat(latex_code)
  sink()
  
  
  keep <- m_new_data %>%
    distinct(`Source type`) %>%
    arrange(`Source type`) %>%
    slice_head(n = 6) %>%
    pull(`Source type`)
  
  m_new_data_1 <- m_new_data %>% filter(`Source type` %in% keep)
  m_mean_1     <- m_mean     %>% filter(`Source type` %in% keep)
  
  
  p1<-plot_data(m_new_data_1,m_mean_1)
  ggsave("outputs/survey_responses_supplement_1.png",p1,height = 10,width = 16)

  
  m_new_data_2 <- m_new_data %>% filter(!(`Source type` %in% keep))
  m_mean_2     <- m_mean     %>% filter(!(`Source type` %in% keep))
  

  p2<-plot_data(m_new_data_2,m_mean_2)
  ggsave("outputs/survey_responses_supplement_2.png",p1,height = 10,width = 16)
  
}


}



