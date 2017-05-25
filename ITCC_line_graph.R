p <- ggplot(data = mouse_data_update,mapping = aes(x=post.surgery,y=mean_lum,group=group))
#data taken from the mouse_data_updated file; need to list the luminescence, standard error, and treatment type all as variables
p+geom_line()+geom_errorbar(ymax=mean_lum+lum_se,ymin=mean_lum-lum_se)+ylim(2,8)+ggtitle("intratibial cancer cell injection")+labs(x="Days post surgery",y="Mean luminescence (log)")
#there's obviously more to play around with in this; i need to sit down with a ggplot book to get a better handle on the aesthetics
p+geom_line()+geom_errorbar(ymax=mean_lum+lum_se,ymin=mean_lum-lum_se)+ylim(2,8)+ggtitle("intratibial cancer cell injection")+labs(x="Days post surgery",y="Mean luminescence (log)")+theme_classic()
#takes away the grid background with theme_classic
p+geom_line()+geom_point()+geom_errorbar(ymax=mean_lum+lum_se,ymin=mean_lum-lum_se)+ylim(2,8)+ggtitle("intratibial cancer cell injection")+labs(x="Days post surgery",y="Mean luminescence (log)")+theme_classic()
#add points to the line with geom_line
p+geom_line()+geom_point()+theme_classic()+geom_errorbar(aes(ymax=mean_lum+lum_se,ymin=mean_lum-lum_se))
#went back and found out that the zeros in the data set were being treated as characters, so I went back and cleaned up the mouse_data_updated data frame from Mouse_luminescence_tracking
#code for correctly generating the data frame is belowcon_28day_mean <- mean((as.numeric(Mouse_luminescence_tracking$Control[31:40])));con_28day_se <- sd(as.numeric(Mouse_luminescence_tracking$Control[31:40]))/sqrt(10)
con_21day_mean <- mean((as.numeric(Mouse_luminescence_tracking$Control[21:30])));con_21day_se <- sd(as.numeric(Mouse_luminescence_tracking$Control[21:30]))/sqrt(10)
con_14day_mean <- mean(as.numeric(Mouse_luminescence_tracking$Control[11:20]));con_14day_se <- sd(as.numeric(Mouse_luminescence_tracking$Control[11:20]))
con_7day_se <- sd(as.numeric(Mouse_luminescence_tracking$Control))/sqrt(10)
con_7day_mean <- mean((as.numeric(Mouse_luminescence_tracking$Control[1:10])))
treat_28day_mean <- mean(as.numeric(Mouse_luminescence_tracking$`	Treatment`[31:40]));treat_28day_se <- sd(as.numeric(Mouse_luminescence_tracking$`	Treatment`[31:40]))/sqrt(10)
treat_21day_mean <- mean(as.numeric(Mouse_luminescence_tracking$`	Treatment`[21:30]));treat_21day_se <- sd(as.numeric(Mouse_luminescence_tracking$`	Treatment`[21:30]))/sqrt(10)
treat_14day_se <- sd(as.numeric(Mouse_luminescence_tracking$`	Treatment`[11:20]))/sqrt(10)
treat_7day_mean <- mean(as.numeric(Mouse_luminescence_tracking$`	Treatment`[1:10]));treat_7day_se <- sd(as.numeric(Mouse_luminescence_tracking$`	Treatment`[1:10]))/sqrt(10)
mouse_data_update <- data.frame("post.surgery"=c(7,14,21,28),mean_lum=c(con_7day_mean,con_14day_mean,con_21day_mean,con_28day_mean,treat_7day_mean,treat_14day_mean,treat_21day_mean,treat_28day_mean),lum_se=c(con_7day_se,con_14day_se,con_21day_se,con_28day_se,treat_7day_se,treat_14day_se,treat_21day_se,treat_28day_se),group=rep(c("con","treat"),each=4))
#added color aesthetic to the ggplot assignment, and it added colors automatically by using the factor group
p <- ggplot(data = mouse_data_update,mapping = aes(x=post.surgery,y=mean_lum,group=group, color=group))
p+geom_line(size=0.75)+geom_point(size=2)+theme_classic()+geom_errorbar(aes(ymax=mean_lum+lum_se,ymin=mean_lum-lum_se),size=0.75)
