# task 1
library(data.table)

runoff_stations <- fread('./data/raw/runoff_stations.csv')

runoff_stations[, sname := factor(abbreviate(station))]
runoff_stations[, id := factor(id)]
runoff_stations[, altitude := round(altitude, 0)]

alterrunoff_stations <- runoff_stations[,.(sname, area, altitude)]

alterrunoff_stations

#task 2
library(ggplot2)
ggplot(data = alterrunoff_stations, 
aes(x = area, y = altitude )) +
geom_point() +
geom_text(aes(label=sname))

#task 3

ggplot(alterrunoff_stations) + geom_line(aes(x=area, y=altitude, color="pcs")) 
+ geom_text(aes(label=sname))

#task 4
ggplot(data = runoff_stations, 
aes(x = area, y = altitude, col = sname)) +
geom_point() +
geom_text(aes(label=sname))

