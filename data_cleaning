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
