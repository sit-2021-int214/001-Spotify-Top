# Answer all define question

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
## 4.) ค่าเฉลี่ยของ loudness เพลงที่ charts 
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
spotify_tops %>% select(Loudness) %>% 
filter(Loudness<(-60) | Loudness>0)
```
### Result :
```{R}
  Loudness
1    1.509      
```

## 7.) เพลงใดบ้างที่อยู่ต่ำกว่าค่าเฉลี่ยของ Tempo
### Code : 
```{R}

```
### Result :
```{R}
      
```

# Summary 
## summary explore data
