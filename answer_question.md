# Data Analysis

## 1.) เพลงของศิลปินคนไหนติด charts บ่อยที่สุด 
### Code : 
```{R}
  spotify_tops %>% select(Artist , `Number of Times Charted`) %>% 
  group_by(Artist) %>% summarise(sumOfNumTimesCharted = sum(`Number of Times Charted`)) %>%
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
spotify_tops %>% select(`Song Name` , Artist , Streams) %>%
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
spotify_tops %>% select(`Song Name` , `Number of Times Charted`) %>%
  slice_max(`Number of Times Charted`)
```
### Result :
```{R}
`Song Name` `Number of Times Charted`
 
1 Falling                           142    
```
## 4.) ค่าเฉลี่ยของ loudness เพลงที่ติด charts 
### Code : 
```{R}
spotify_tops %>% select(Loudness) %>%
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
spotify_tops %>% select(Chord) %>% group_by(Chord) %>%
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
spotify_tops %>% select(`Song Name`,Loudness) %>% 
  filter(Loudness < (-60) | Loudness>0)
```
### Result :
```{R}
  `Song Name`        Loudness
  <chr>                 <dbl>
1 Na Raba Toma Tapão     1.51     
```

## 7.) เพลงใดบ้างที่อยู่ต่ำกว่าค่าเฉลี่ยของ Tempo
### Code : 
```{R}
spotify_tops %>% select(`Song Name`,Tempo) %>%
  filter(Tempo < mean(Tempo,na.rm=TRUE)) %>% arrange(Tempo)
```
### Result :
```{R}
`Song Name`                       Tempo
   <chr>                             <dbl>
 1 Carol of the Bells                 46.7
 2 Rover (feat. DTG)                  62.9
 3 Changes                            64.1
 4 changes                            64.9
 5 Alone Again                        65.4
 6 a m a r i                          66.0
 7 I Want It                          66.4
 8 Let Me Love You Like A Woman       66.9
 9 The Take (feat. Chris Brown)       67.0
10 Rockin' Around The Christmas Tree  67.2
# … with 776 more rows   
```

# Summary 
จากการที่พวกเราได้ทำ Data Analysis สามารถสรุปได้ว่า  
1. เพลงของศิลปินที่ติด charts บ่อยที่สุด คือ เพลงของ Billie Eilish ซึ่งติด Charts ไปถึง 432 ครั้งในปี 2020-2021
2. เพลง 3 อันดับแรก ที่มีจำนวนการสตรีมสูงสุด คือ 

| No. | ชื่อเพลง                       | ชื่อศิลปิน           | จำนวนการสตรีม |
|:---:|----------------------------- |------------------|------------- |
|  1  | Beggin                       | Måneskin         | 48633449     |
|  2  | STAY (with Justin Bieber)    | The Kid LAROI    | 47248719     |
|  3  | good 4 u                     | Olivia Rodrigo   | 40162559     |

3. เพลงที่มีจำนวนครั้งในการขึ้นชาตมากที่สุด ?

| No. | ชื่อเพลง                       | จำนวนครั้งที่ขึ้น Charts  | 
|:---:|----------------------------- |---------------------|
|  1  | Beggin                       | 142                 | 
4. ค่าเฉลี่ยของ loudness เพลงที่ติด charts คือ -6.348474 
5. chord ที่นิยมนำมาใช้ในเพลงที่ติด charts มากที่สุด คือ คอร์ด C# และ คอร์ด Db ซึ่งจำนวนทั้งหมด 214 เพลงที่ใช้คอร์ดนี้
6. เพลงที่ติด charts แต่มี loundness ไม่อยู่ในค่าเฉลี่ย(-60 ถึง 0) คือ เพลง Na Raba Toma Tapão 
7. เพลงที่อยู่ต่ำกว่าค่าเฉลี่ยของ Tempo มีทั้งหมด 776 เพลง ซึ่งเพลงที่มี Tempo ต่ำกว่าค่าเฉลี่ยมากสุดคือเพลง Carol of the Bells  ที่มี Tempo อยู่ที่ 46.7


## summary explore data
