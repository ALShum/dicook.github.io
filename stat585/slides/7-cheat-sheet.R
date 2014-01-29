oz <- extractPolygons(xxx)
xx@data$elec_id <- 1:150

oz_all <- merge(oz, xx@data, by.x="region", by.y="elec_id")
qplot(x, y, order=order, group=group, data=oz_all, geom="polygon", 
      fill=AREA_SQKM) + theme_bw()

# Reading fixed data
oz_poll_stns <- read.csv("data/australia/polling-stns.csv", stringsAsFactors=FALSE)

oz_poll_stns$Lat <- as.numeric(oz_poll_stns$Lat)
oz_poll_stns$Long <- as.numeric(oz_poll_stns$Long)
table(oz_poll_stns$StateAb)
ggplot() + geom_polygon(data=oz_all, aes(x=x, y=y, order=order, group=group)) + 
  geom_point(data=subset(oz_poll_stns, Status!="Abolition"), aes(x=Long, y=Lat), colour=I("red")) + 
  theme_bw()
