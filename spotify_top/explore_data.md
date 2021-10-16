# Spotify Top 200 Charts (2020-2021)

Dataset from : https://www.kaggle.com/sashankpillai/spotify-top-200-charts-20202021

# Defind a question
1. A
2. B

# Loading library and dataset

#library
```{R}
library(readr)
library(assertive)
library(stringr)
library(dplyr)
```
#DataSet
```{R}
spotify_tops <- read_csv("/Users/burats/Desktop/Itkmutty2/INT214/spotify_dataset.csv")
View(spotify_tops)
```

## 1.) เพลงของศิลปินคนไหนขึ้น charts บ่อยที่สุด
# Code : 
```{R}
  spotify %>% select(Artist,Number.of.Times.Charted) %>% 
  group_by(Artist) %>% 
  summarise(sumOfNumTimesCharted = sum(Number.of.Times.Charted)) %>%
  slice_max(sumOfNumTimesCharted)
```
# Result :
```{R}
 Artist        sumOfNumTimesCharted
  <chr>                        <int>
1 Billie Eilish                  432
```
