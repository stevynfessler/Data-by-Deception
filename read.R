setwd("/Users/Jay/Google Drive/Rstudio_WD")
file <- read.csv("train.csv", header = TRUE, sep = ",")
prop = .1
indexs <- sample(1:nrow(file),size = (prop)*(nrow(file)), replace = FALSE)
df <- file[indexs, ]
#print(df)
colnames(df) <- c("Dates","Category","Description","Day of Week", "Police District", "Resolution","Address","X","Y")

library(leaflet)
sf_map <- leaflet() %>%
    addTiles()
sf_map = leaflet()
sf_map = addTiles(sf_map)
sf_map