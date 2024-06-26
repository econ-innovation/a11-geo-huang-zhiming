install.packages("sf")
install.packages("tmap")
install.packages("terra")
install.packages("spData")
install.packages("spDataLarge", repos = "https://nowosad.r-universe.dev")
library(sf)
library(terra)
library(spData)
library(spDataLarge)
dv_zone <- read_sf(dsn = 
"~/R/assignment/assigment_geo/G341022合肥经济技术开发区.txt")
class(dv_zone)
plot(dv_zone)
dv_zone_1 <- read_sf(dsn = 
"~/R/assignment/assigment_geo/G342020合肥高新技术产业开发区区块一.txt")
class(dv_zone_1)
plot(dv_zone_1)
dv_zone_2 <- read_sf(dsn = 
"~/R/assignment/assigment_geo/G342020合肥高新技术产业开发区区块二.txt")
class(dv_zone_2)
plot(dv_zone_2)
firms <- read.table("~/R/assignment/assigment_geo/hefei.txt", header=TRUE)
firms_sf <- st_as_sf(firms, coords = c("lng", "lat"), crs = 4326)
inner_dv <- st_intersects(firms_sf, dv_zone)
num_firms_dv <- sum(!is.na(inner_dv))
print(num_firms_dv)
inner_dv_1 <- st_intersects(firms_sf, dv_zone_1)
num_firms_dv_1 <- sum(!is.na(inner_dv_1))
print(num_firms_dv_1)
inner_dv_2 <- st_intersects(firms_sf, dv_zone_2)
num_firms_dv_2 <- sum(!is.na(inner_dv_2))
print(num_firms_dv_2)
#第二题
radius <- c(1000, 3000, 5000)
for (r in radius) {
  dv_zone_buffer <- st_buffer(dv_zone, dist = r)
  dv_zone1_buffer <- st_buffer(dv_zone_1, dist = r)
  dv_zone2_buffer <- st_buffer(dv_zone_2, dist = r)
  
  inner_buffer <- st_intersects(firms_sf, dv_zone_buffer)
  inner_buffer_1 <- st_intersects(firms_sf, dv_zone1_buffer)
  inner_buffer_2 <- st_intersects(firms_sf, dv_zone2_buffer)
  
  num_dvz_buffer <- sum(sapply(inner_buffer, length))
  num_dvz1_buffer <- sum(sapply(inner_buffer_1, length))
  num_dvz2_buffer <- sum(sapply(inner_buffer_2, length))
print(num_dvz_buffer)
print(num_dvz1_buffer)
print(num_dvz2_buffer)
