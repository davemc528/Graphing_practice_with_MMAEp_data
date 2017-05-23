p <- ggplot(data = mouse_data_update,mapping = aes(x=post.surgery,y=mean_lum,group=group))
#data taken from the mouse_data_updated file; need to list the luminescence, standard error, and treatment type all as variables
p+geom_line()+geom_errorbar(ymax=mean_lum+lum_se,ymin=mean_lum-lum_se)+ylim(2,8)+ggtitle("intratibial cancer cell injection")+labs(x="Days post surgery",y="Mean luminescence (log)")
#there's obviously more to play around with in this; i need to sit down with a ggplot book to get a better handle on the aesthetics