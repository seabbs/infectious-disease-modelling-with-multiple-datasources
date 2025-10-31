
#generate the plot

plot_data<-function(dat,menas){
  
 plot<- ggplot(data=dat,aes(x=value,y=as.factor(variable),color=variable))+
    geom_line(aes(linewidth=3),alpha=.8)+
    geom_point(data=menas,aes(x=value,y=as.factor(variable),fill=variable),size=3,shape =25,colour="black")+
    facet_grid(comp_dat~`Source type`,scales="free_y",space="free")+
    ylab("Data Characteristic")+
    xlab("Response")+
    #scale_fill_brewer(palette = "Paired")+
    #  scale_color_brewer(palette = "Paired")+
    theme_cleveland(16)+
    theme(
      legend.position = "none",
      strip.text = element_text(face = "bold"),
      panel.spacing = unit(1, "cm"))
  
  return(plot)
}
