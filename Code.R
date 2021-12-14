library(tidyverse)
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2021-12-14')

tuesdata$studio_album_tracks->tracks


tracks%>%
  distinct()%>%
  select(track_name,speechiness,danceability,energy,liveness)->data1
  
ggplot(data1,aes(speechiness,energy,fill=danceability,size=liveness))+
  geom_jitter(pch=21,colour="gray75")+
  scale_fill_distiller(palette = "RdBu",direction = 1)+
  labs(fill="Danceability: ",size="Liveliness: ")+
  scale_x_continuous(limits = c(0.02,0.16),breaks=c(.02,0.04,0.06,0.08,0.10,0.12,0.14,0.16))+
  theme(plot.margin=unit(c(0.5,1.5,0.5,1.5),"cm"),
        plot.background = element_rect(fill="black"),
        panel.background = element_rect(fill="black"),
        panel.grid = element_blank(),
        axis.line = element_line(colour = "white"),
        axis.text = element_text(colour="white",size=10,face="bold"),
        axis.title.x = element_text(colour="white",size=10, face="bold",margin=margin(t=15)),
        axis.title.y = element_text(colour="white",size=10, face="bold",margin=margin(r=15)),
        legend.background = element_rect(fill="black"),
        legend.key = element_rect(fill="black"),
        legend.text=element_text(colour="white",margin=margin(l=15),face="bold"),
        legend.key.height = unit(1,"cm"),
        legend.box = "vertical",
        legend.title = element_text(colour="white",face="bold",size=12,margin=margin(b=15)),
        legend.position = "right",
        plot.title.position = "plot",
        plot.caption.position = "plot",
        plot.title=element_text(size=14, face="bold",colour="white",margin=margin(b=15)),
        plot.subtitle = element_text(size=12, colour="white",margin=margin(b=25)),
        plot.caption=element_text(size=10,colour="white",hjust=0,margin=margin(t=20)))+
  labs(title="SPICE GIRLS' SONGS: 93% SONGS ARE HIGH ON ENERGY BECAUSE THEY ARE LESS SPEECHY, BUT...",
       subtitle=str_wrap("...Move Over, If U Can't Dance and Denying are anomalies in this case. Despite being on the higher scale comparitively, in speechiness, they have good energy and fairly high danceability scores too",100),
       caption = "Data via Tidy Tuesday| Analysis and design: @annapurani93")+
  xlab("-------------SPEECHINESS---------------")+
  ylab("-------------ENERGY--------------")+
  annotate("text",x=0.0887,y=0.934,label="Move Over",colour="white",vjust=-1,size=4)+
  annotate("text",x= 0.14,y=0.786,label="If U Can't Dance",colour="white",vjust=-1,size=4)+
  annotate("text",x= 0.0882,y=0.702,label="Denying",colour="white",vjust=-1,size=4)->plot


ggsave("spicegirls1.png",plot,width=11,height=7)



