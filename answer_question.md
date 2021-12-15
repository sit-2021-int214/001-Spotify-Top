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
จากการทำ Data Analysis สามารถสรุปได้ว่า เพลงของศิลปินที่ติด charts บ่อยที่สุด คือ เพลงของ Billie Eilish ซึ่งติด Charts ไปถึง 432 ครั้งในปี 2020-2021

## 2.) เพลง 3 อันดับแรก ที่มีจำนวนการสตรีมสูงสุด 
### Code : 
```{R}
spotify_tops %>% select(`Song Name` , Artist , Streams, Genre) %>%
  slice_max(Streams,n=3)
```
### Result :
```{R}
 `Song Name`               Artist          Streams Genre                             
  <chr>                     <chr>             <dbl> <chr>                             
1 Beggin'                   Måneskin       48633449 ['indie rock italiano', 'italian ~
2 STAY (with Justin Bieber) The Kid LAROI  47248719 ['australian hip hop']            
3 good 4 u                  Olivia Rodrigo 40162559 ['pop'] 
```
จากการทำ Data Analysis สามารถสรุปได้ว่า เพลง 3 อันดับแรก ที่มีจำนวนการสตรีมสูงสุด คือ 

| No. | ชื่อเพลง                       | ชื่อศิลปิน           | จำนวนการสตรีม |ประเภทของเพลง|
|:---:|----------------------------- |------------------|------------- |---------------|
|  1  | Beggin                       | Måneskin         | 48633449     |indie rock italiano,italian pop|
|  2  | STAY (with Justin Bieber)    | The Kid LAROI    | 47248719     |australian hip hop|
|  3  | good 4 u                     | Olivia Rodrigo   | 40162559     |pop|

## 3.) เพลงที่มีจำนวนครั้งในการขึ้นชาตมากที่สุด 
### Code : 
```{R}
spotify_tops %>% select(`Song Name` , `Number of Times Charted`,Genre) %>%
  slice_max(`Number of Times Charted`,n=3) %>% filter(Genre != '[]')
```
### Result :
```{R}
`Song Name`               `Number of Times Charted` Genre                              
   <chr>                                     <dbl> <chr>                              
 1 Falling                                     142 ['pop', 'post-teen pop']           
 2 Circles                                      84 ['dfw rap', 'melodic rap', 'rap']  
 3 Blinding Lights                              83 ['canadian contemporary r&b', 'can~
 4 Watermelon Sugar                             83 ['pop', 'post-teen pop']           
 5 Someone You Loved                            83 ['pop', 'uk pop']                  
 6 Dance Monkey                                 83 ['australian pop', 'pop']          
 7 Before You Go                                83 ['pop', 'uk pop']                  
 8 Believer                                     83 ['modern rock', 'pop', 'rock']     
 9 Roses - Imanbek Remix                        83 ['melodic rap', 'pop rap', 'rap', ~
10 lovely (with Khalid)                         83 ['electropop', 'pop']              
11 Señorita                                     83 ['canadian pop', 'dance pop', 'pop~
12 Perfect                                      83 ['pop', 'uk pop']                  
13 Memories                                     83 ['pop', 'pop rock']                
14 goosebumps                                   83 ['rap', 'slap house']              
15 Shallow                                      83 ['dance pop', 'pop', 'post-teen po~
16 Lucid Dreams                                 83 ['chicago rap', 'melodic rap']     
17 Adore You                                    83 ['pop', 'post-teen pop']   
```
จากการทำ Data Analysis สามารถสรุปได้ว่า เพลงที่มีจำนวนครั้งในการขึ้นชาตมากที่สุด คือ

| No. | ชื่อเพลง                       | จำนวนครั้งที่ขึ้น Charts  | ประเภาทของเพลง|
|:---:|----------------------------- |---------------------|----------------|
|  1  | Beggin                       | 142                 | pop, post-teen pop|

และจะสังเกตใน column "Genre" ได้ว่า ประเภทเพลงที่ได้รับความนิยม ส่วนใหญ่จะเป็น "pop"

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
จากการทำ Data Analysis สามารถสรุปได้ว่า ค่าเฉลี่ยของ loudness เพลงที่ติด charts คือ -6.348474 

## 5.) chord ใด ที่นิยมนำมาใช้ในเพลงที่ติด charts มากที่สุด 
### Code : 
```{R}
spotify_tops %>% select(Chord) %>% group_by(Chord) %>% 
  count(Chord) %>%filter(Chord != '') %>% arrange(desc(n))
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
```
จากการทำ Data Analysis สามารถสรุปได้ว่า chord ที่นิยมนำมาใช้ในเพลงที่ติด charts มากที่สุด คือ คอร์ด C# และ คอร์ด Db ซึ่งมีจำนวนทั้งหมด 214 เพลงที่ใช้คอร์ดนี้

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
จากการทำ Data Analysis สามารถสรุปได้ว่า เพลงที่ติด charts แต่มี loundness ไม่อยู่ในค่าเฉลี่ย(-60 ถึง 0) คือ เพลง Na Raba Toma Tapão

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
จากการทำ Data Analysis สามารถสรุปได้ว่า เพลงที่อยู่ต่ำกว่าค่าเฉลี่ยของ Tempo มีทั้งหมด 776 เพลง ซึ่งเพลงที่มี Tempo ต่ำกว่าค่าเฉลี่ยมากสุดคือเพลง Carol of the Bells  ที่มี Tempo อยู่ที่ 46.7 แล้วค่าเฉลี่ยของ Tempo คือเท่าไหร่??
### Code :
```{R}
spotify_tops %>% summarise(avgTempo = mean(Tempo,na.rm=TRUE))
```
### Result :
```{R}
  avgTempo
1  122.811
```
## 8.) ศิลปินคนใดมียอดผู้ติดตามบน spotify มากที่สุด
### Code :
```{R}
spotify_tops %>% select(Artist , `Artist Followers`) %>% 
  group_by(Artist) %>%  summarise(maxFollower = max(`Artist Followers`)) %>%
  slice_max(maxFollower)
```
### Result :
```{R}
  Artist     maxFollower
  <chr>            <dbl>
1 Ed Sheeran    83337783
```
ค่าเฉลี่ยของ Tempo คือ 122.811
# Summary explore data
หลังจากที่เราทำการเลือกหัวข้อมาได้แล้ว เราก็จะทำการ Explore Data เพื่อตรวจสอบข้อมูล หลังจากนั้นทำการ Clean Data เพื่อเตรียมข้อมูลก่อนนำไปวิเคราะห์ ซึ่งจะทำการลบหรือแก้ไขข้อมูลที่ไม่ถูกต้อง หรือข้อมูลที่ซ้ำกันออก หลังจากที่เราคัดเลือกข้อมูลแล้ว เราก็มาทำการวิเคราะ์ข้อมูลที่เราเลือกมา ซึ่งทำให้เราทราบว่าเพลงที่ติด Top Charts บ่อยที่สุดนั่นก็คือ เพลงของ "Billie Eilish" แต่ผู้ที่มียอดติดตามบน spotify มากที่สุดคือ "Ed Sheeran" และยังสามารถทราบได้อีกว่าเพลงส่วนใหญ่ที่ติด charts เป็นเพลงแนว pop แม้กระทั่งเพลงที่มีจำนวน streams มากที่สุดก็เป็นแนว pop เช่นกัน ซึ่งเราก็จะสามารถนำข้อมูลไปวิเคราะห์ต่อได้และสามารถนำไปประยุกต์ใช้ในการทำเพลงหรือแนวทางในเรื่องของดนตรีได้อีกด้วย

ต่อไปเราจะมาทำ [Data Visualization](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/data_viz.md) ด้วย Power BI กันค่ะ
