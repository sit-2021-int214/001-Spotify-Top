# Spotify Top 200 Charts (2020-2021)

Dataset from : https://www.kaggle.com/sashankpillai/spotify-top-200-charts-20202021

# Defind a question
1. อยากทราบว่าเพลงของศิลปินคนไหนติด charts บ่อยที่สุด ?
2. เพลง 3 อันดับแรก ที่มีจำนวนการสตรีมสูงสุด ?
3. เพลงที่มีจำนวนครั้งในการขึ้นชาตมากที่สุด ?
4. ค่าเฉลี่ยของ loudness เพลงที่ charts ?
5. chord ใด ที่นิยมนำมาใช้ในเพลงที่ติด charts มากที่สุด ?
6. มีเพลงใดบ้างที่ติด charts แต่ มี loundness ไม่อยู่ในค่าเฉลี่ย ?
 

# Step 0 : Loading library and import dataset

### library
```{R}
library(readr)
library(assertive)
library(stringr)
library(dplyr)
```
### DataSet
```{R}
spotify_tops <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/001-Spotify-Top/main/spotify_dataset_original.csv")
View(spotify_tops)
```
# Step 1 : check missing values
```{R}
glimpse(spotify_tops)
summary(spotify_tops)

spotify_tops %>% head()
spotify_tops %>% View()
```
# Step 2 : Check types of values
```{R}
is.numeric(spotify_tops$Index)  
#TRUE

is.numeric(spotify_tops$`Highest Charting Position`)    
#TRUE

is.numeric(spotify_tops$`Number of Times Charted` )    
#TRUE

is_date(spotify_tops$`Week of Highest Charting` )    
#FALSE
assert_is_date(spotify_tops$`Week of Highest Charting`)
#Error: is_date : spotify_tops$`Week of Highest Charting` is not of class 'Date'; it has class 'character'.

is.character(spotify_tops$`Song Name`)   
#TRUE

is.numeric(spotify_tops$Streams) 
#TRUE

is.character(spotify_tops$Artist) 
#TRUE

is.numeric(spotify_tops$`Artist Followers`)
#TRUE

is.character(spotify_tops$`Song ID`)  
#TRUE

is.character(spotify_tops$Genre)  
#TRUE

is_date(spotify_tops$`Release Date`)  
#FALSE
assert_is_date(spotify_tops$`Release Date`)
#Error: is_date : spotify_tops$`Release Date` is not of class 'Date'; it has class 'character'.

is_date(spotify_tops$`Weeks Charted`)  
#FALSE
assert_is_date(spotify_tops$`Weeks Charted`)
#Error: is_date : spotify_tops$`Weeks Charted` is not of class 'Date'; it has class 'character'.

is.numeric(spotify_tops$Popularity)  
#TRUE

is.numeric(spotify_tops$Danceability)  
#TRUE

is.numeric(spotify_tops$Energy)  
#TRUE

is.numeric(spotify_tops$Loudness)  
#TRUE

is.numeric(spotify_tops$Speechiness)  
#TRUE

is.numeric(spotify_tops$Acousticness)  
#TRUE

is.numeric(spotify_tops$Liveness)  
#TRUE

is.numeric(spotify_tops$Loudness)  
#TRUE

is.numeric(spotify_tops$Tempo)  
#TRUE

is.numeric(spotify_tops$`Duration (ms)`)  
#TRUE

is.numeric(spotify_tops$Valence)  
#TRUE

is.character(spotify_tops$Chord)  
#TRUE
```

# Step 3 : Changing the types of values
```{R}
spotify_tops$Genre <- as.factor(spotify_tops$Genre)
summary(spotify_tops$Genre)

spotify_tops$`Release Date` <- as.Date(spotify_tops$`Release Date`)
summary(spotify_tops$`Release Date`)
```

# Step 4 : Check duplicated data
```{R}
spotify_tops %>% duplicated() %>% table()  #FALSE
```

# Step 5 : Explore Data Analysis

## 1.) เพลงของศิลปินคนไหนติด charts บ่อยที่สุด 
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

## 2.) เพลง 3 อันดับแรก ที่มีจำนวนการสตรีมสูงสุด 
### Code : 
```{R}
spotify %>% select(Song.Name,Artist,Streams) %>%
  slice_max(Streams,n=3)
```
### Result :
```{R}
  Song Name               Artist          Streams
                          
1 Beggin'                   Måneskin       48633449
2 STAY (with Justin Bieber) The Kid LAROI  47248719
3 good 4 u                  Olivia Rodrigo 40162559
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
## 4.) ค่าเฉลี่ยของ loudness เพลงที่ charts 
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
## 5.) chord ใด ที่นิยมนำมาใช้ในเพลงที่ติด charts มากที่สุด 
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
## 6.) มีเพลงใดบ้างที่ติด charts แต่ มี loundness ไม่อยู่ในค่าเฉลี่ย (ค่าเฉลี่ย -60 ถึง 0)
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

# Summary 
## summary explore data
