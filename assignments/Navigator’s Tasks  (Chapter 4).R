# task 1
library(data.table)
library(ggplot2)
library(moments)

runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0),
                               sd_day = round(sd(value), 0),
                               min_day = round(min(value), 0),
                               max_day = round(max(value), 0)), by = sname]
head(runoff_stats, 4)

ggplot(runoff_stats, aes(x= sname, y=mean_day, col= sname ))+ geom_point()+
       geom_point(size=2, shape=23)
         
# task 2 
library(moments)
skewness(runoff_stats$sd_day)
skewness(runoff_stats$mean_day)
skewness(runoff_stats$min_day)
skewness(runoff_stats$max_day)

sd(runoff_stats$sd_day, na.rm=TRUE)/
  mean(runoff_stats$sd_day, na.rm=TRUE)*100  #Coefficient of variation, as percent

# task 3 
runoff_month <- runoff_day[, .(value = mean(value)), by = .(month, year, sname)]
runoff_month[, date := as.Date(paste0(year, '-', month, '-1'))]

runoff_month

runoff_month_boxplot <- ggplot(runoff_month, aes(x=month, y=year, group=sname)) + 
  geom_boxplot(aes(fill=sname))

#task 4
# not complete(notcorrect)

runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0),
                               sd_day = round(sd(value), 0),
                               min_day = round(min(value), 0),
                               max_day = round(max(value), 0)), by = sname]
head(runoff_stats, 4)

runoff_day_boxplot <- ggplot(runoff_day, aes(x=min_day, y=max_day, group=sname)) + 
  geom_boxplot(aes(fill=sname))

runoff_day_boxplot


# task 5
# i will try it again

library(data.table)

ggplot(runoff_stations, aes(x=area, y=altitude, col=sname)) +geom_point() +
geom_point(size=2, shape=23)
                                           

       
