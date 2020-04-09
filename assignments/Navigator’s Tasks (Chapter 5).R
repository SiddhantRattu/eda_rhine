# task
library(data.table)
library(ggplot2)
runoff_year_key <- readRDS('data/runoff_year_key.rds')
runoff_month_key <- readRDS('data/runoff_month_key.rds')

colset_4 <-  c("#D35C37", "#BF9A77", "#D6C6B9", "#97B8C2")

runoff_summary <- readRDS('data/runoff_summary.rds')
runoff_stats <- readRDS('data/runoff_stats.rds')
runoff_month <- readRDS('data/runoff_month.rds')
runoff_summer <- readRDS('data/runoff_summer.rds')
runoff_winter <- readRDS('data/runoff_winter.rds')
runoff_year <- readRDS('data/runoff_year.rds')

year_thres <- 2000

runoff_winter_key[year < year_thres, period := factor('pre_2000')]
runoff_winter_key[year >= year_thres, period := factor('aft_2000')]
runoff_summer_key[year < year_thres, period := factor('pre_2000')]
runoff_summer_key[year >= year_thres, period := factor('aft_2000')]

to_plot <- rbind(cbind(runoff_winter_key, season = factor('winter')), 
                 cbind(runoff_summer_key, season = factor('summer'))) 

ggplot(to_plot, aes(x = year, y = value)) +
  geom_line(col = colset_4[3])+
  geom_point(col = colset_4[3])+
  facet_wrap(~sname, scales = 'free') +
  geom_smooth(method = 'lm', formula = y~x, se = 0, col = colset_4[1]) +
  geom_smooth(method = 'loess', formula = y~x, se = 0, col = colset_4[4]) +
  scale_color_manual(values = colset_4[c(1, 2, 4)]) +
  xlab(label = "Year") +
  ylab(label = "Runoff (m3/s)") +
  theme_bw()



ggplot(to_plot, aes(season, value, fill = period)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free_y') +
  scale_fill_manual(values = colset_4[c(4, 1)]) +
  xlab(label = "period") +
  ylab(label = "Runoff (m3/s)") +
  theme_bw()

# task 2 (not complete)

library(data.table)
library(ggplot2)

runoff_day <- readRDS("./data/runoff_day_raw.rds")

head(runoff_day)




# task 3
library(data.table)
library(ggplot2)

runoff_month <- readRDS('data/runoff_month.rds')
runoff_summer <- readRDS('data/runoff_summer.rds')
runoff_winter <- readRDS('data/runoff_winter.rds')
runoff_year <- readRDS('data/runoff_year.rds')


#1850-2010
ggplot(runoff_year_key[year < 2010], aes(x = year, y = value_norm, col = sname)) +
  geom_line() +
  geom_point() + 
  scale_color_manual(values = colset_4[c(1, 2, 4)]) +
  xlab(label = "Year") +
  ylab(label = "Runoff (m3/s)")

# data from 2011-2016
ggplot(runoff_year_key[year > 2010], aes(x = year, y = value_norm, col = sname)) +
  geom_line() +
  geom_point() + 
  scale_color_manual(values = colset_4[c(1, 2, 4)]) +
  xlab(label = "Year") +
  ylab(label = "Runoff (m3/s)")


