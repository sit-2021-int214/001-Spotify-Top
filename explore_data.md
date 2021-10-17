# Spotify Top 200 Charts (2020-2021)

Dataset from : https://www.kaggle.com/sashankpillai/spotify-top-200-charts-20202021

# Defind a question
1. A
2. B

# Loading library and dataset

### library
```{R}
library(readr)
library(assertive)
library(stringr)
library(dplyr)
```
### DataSet
```{R}
spotify_tops <- read_csv("/Users/burats/Desktop/Itkmutty2/INT214/spotify_dataset.csv")
View(spotify_tops)
```

## 1.) เพลงของศิลปินคนไหนขึ้น charts บ่อยที่สุด
### Code : 
```{R}
  spotify %>% select(Artist,Number.of.Times.Charted) %>% 
  group_by(Artist) %>% 
  summarise(sumOfNumTimesCharted = sum(Number.of.Times.Charted)) %>%
  slice_max(sumOfNumTimesCharted)
```
### Result :
```{R}
 Artist        sumOfNumTimesCharted
  <chr>                        <int>
1 Billie Eilish                  432
```

## 2.) TOP 3 Highest Stream
### Code : 
```{R}
spotify %>% select(Song.Name,Artist,Streams) %>%
  slice_max(Streams,n=3)
```
### Result :
```{R}
         Song.Name       Artist   Streams
1             UGH!          BTS 9,991,177
2 Bigger Than Life Lil Uzi Vert 9,974,143
3       Time Flies        Drake 9,904,749
```
## 3.) เพลงที่มีจำนวนครั้งในการขึ้นชาตมากที่สุด
### Code : 
```{R}
spotify %>% select(Song.Name,Number.of.Times.Charted) %>%
  slice_max(Number.of.Times.Charted)
```
### Result :
```{R}
  Song.Name Number.of.Times.Charted
1   Falling                     142      
```
## 4.) ค่าเฉลี่ยของ loudness เพลงที่ติดชาร์ต
### Code : 
```{R}
spotify %>% select(Loudness) %>%
  summarise(avgLoundness = mean(Loudness,na.rm=TRUE))
```
### Result :
```{R}
  avgLoundness
1    -6.348474        
```
## 5.) chord ที่ใช้ในเพลง ที่ได้รับความนิยมมากที่สุด
### Code : 
```{R}
spotify %>% select(Chord) %>% group_by(Chord) %>%
  count(Chord) %>% arrange(desc(n))
```
### Result :
```{R}
   Chord       n
   <chr>   <int>
 1 "C#/Db"   214
 2 "C"       155
 3 "B"       141
 4 "G"       136
 5 "F"       131
 6 "G#/Ab"   130
 7 "D"       125
 8 "A#/Bb"   122
 9 "F#/Gb"   121
10 "A"       118
11 "E"       112
12 "D#/Eb"    40
13 " "        11        
```
## 6.) เพลงอะไรบ้างที่มี loundness ไม่อยู่ในค่าเฉลี่ย (ค่าเฉลี่ย -60 ถึง 0)
### Code : 
```{R}
spotify %>% select(Loudness) %>% 
  filter(Loudness<(-60) | Loudness>0)
```
### Result :
```{R}
  Loudness
1    1.509      
```

## 7.) 
### Code : 
```{R}

```
### Result :
```{R}
      
```
