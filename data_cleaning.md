# Spotify Top 200 Charts (2020-2021)

Dataset from : https://www.kaggle.com/sashankpillai/spotify-top-200-charts-20202021

รวม code ที่พวกเราใช้ clean data : [R file](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/clean_data.R) 
## Step 0 : Loading library

ในขั้นตอนแรกนี้ เราจะต้อง import library ที่เราต้องการจะใช้ในการ clean data และวิเคราะห์ข้อมูลก่อน โดยใช้คำสั่ง `library()` 
```{R}
library(readr)
library(assertive)
library(stringr)
library(dplyr)
```
# Step 1 : check missing values

```{R}
summary(spotify_tops)
```

Result for summary(spotify_tops) will show that column have Missing Value
```{R}
Index        Highest Charting Position Number of Times Charted Week of Highest Charting
 Min.   :   1.0   Min.   :  1.00            Min.   :  1.00          Length:1556             
 1st Qu.: 389.8   1st Qu.: 37.00            1st Qu.:  1.00          Class :character        
 Median : 778.5   Median : 80.00            Median :  4.00          Mode  :character        
 Mean   : 778.5   Mean   : 87.74            Mean   : 10.67                                  
 3rd Qu.:1167.2   3rd Qu.:137.00            3rd Qu.: 12.00                                  
 Max.   :1556.0   Max.   :200.00            Max.   :142.00                                  
                                                                                            
  Song Name            Streams            Artist          Artist Followers     Song ID         
 Length:1556        Min.   : 4176083   Length:1556        Min.   :    4883   Length:1556       
 Class :character   1st Qu.: 4915322   Class :character   1st Qu.: 2123734   Class :character  
 Mode  :character   Median : 5275748   Mode  :character   Median : 6852509   Mode  :character  
                    Mean   : 6340219                      Mean   :14716903                     
                    3rd Qu.: 6455044                      3rd Qu.:22698747                     
                    Max.   :48633449                      Max.   :83337783                     
                                                          NA's   :11                           
                                          Genre       Release Date        Weeks Charted     
 []                                          :  75   Min.   :1942-01-01   Length:1556       
 ['dance pop', 'pop', 'post-teen pop']       :  71   1st Qu.:2020-01-17   Class :character  
 ['latin', 'reggaeton', 'trap latino']       :  63   Median :2020-06-19   Mode  :character  
 ['pop', 'post-teen pop']                    :  57   Mean   :2019-03-08                     
 ['melodic rap', 'philly rap', 'rap', 'trap']:  33   3rd Qu.:2021-01-14                     
 (Other)                                     :1246   Max.   :2021-08-13                     
 NA's                                        :  11   NA's   :28                             
   Popularity      Danceability       Energy          Loudness        Speechiness    
 Min.   :  0.00   Min.   :0.150   Min.   :0.0540   Min.   :-25.166   Min.   :0.0232  
 1st Qu.: 65.00   1st Qu.:0.599   1st Qu.:0.5320   1st Qu.: -7.491   1st Qu.:0.0456  
 Median : 73.00   Median :0.707   Median :0.6420   Median : -5.990   Median :0.0765  
 Mean   : 70.09   Mean   :0.690   Mean   :0.6335   Mean   : -6.348   Mean   :0.1237  
 3rd Qu.: 80.00   3rd Qu.:0.796   3rd Qu.:0.7520   3rd Qu.: -4.711   3rd Qu.:0.1650  
 Max.   :100.00   Max.   :0.980   Max.   :0.9700   Max.   :  1.509   Max.   :0.8840  
 NA's   :11       NA's   :11      NA's   :11       NA's   :11        NA's   :11      
  Acousticness         Liveness          Tempo        Duration (ms)       Valence      
 Min.   :0.000026   Min.   :0.0197   Min.   : 46.72   Min.   : 30133   Min.   :0.0320  
 1st Qu.:0.048500   1st Qu.:0.0966   1st Qu.: 97.96   1st Qu.:169266   1st Qu.:0.3430  
 Median :0.161000   Median :0.1240   Median :122.01   Median :193591   Median :0.5120  
 Mean   :0.248695   Mean   :0.1812   Mean   :122.81   Mean   :197941   Mean   :0.5147  
 3rd Qu.:0.388000   3rd Qu.:0.2170   3rd Qu.:143.86   3rd Qu.:218902   3rd Qu.:0.6910  
 Max.   :0.994000   Max.   :0.9620   Max.   :205.27   Max.   :588139   Max.   :0.9790  
 NA's   :11         NA's   :11       NA's   :11       NA's   :11       NA's   :11      
    Chord          
 Length:1556       
 Class :character  
 Mode  :character  
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
จาก code ด้านบนเราได้ทำการตรวจสอบประเภทของข้อมูล ซึ่งตัวแปรที่มีชื่อว่า Week of Highest Charting, Release Date และ Weeks Charted มีประเภทข้อมูลเป็น character 
# Step 3 : Changing the types of values
```{R}
spotify_tops$Genre <- as.factor(spotify_tops$Genre)
summary(spotify_tops$Genre)

spotify_tops$`Release Date` <- as.Date(spotify_tops$`Release Date`)
summary(spotify_tops$`Release Date`)
```
ทำการเปลี่ยน Type ของ Genre ให้เป็น factor เพื่อให้เข้าถึงข้อมูลได้ง่ายขึ้น และเปลี่ยน Type ของ Release Date ให้เป็น Date 

# Step 4 : Check duplicated data
```{R}
spotify_tops %>% duplicated() %>% table()  #FALSE
```
ทำการตรวจสอบว่า dataset ที่เรานำมานั้น มีข้อมูลที่ซ้ำกันหรือไม่ จากด้านบน dataset ชุดนี้ไม่มีข้อมูลที่ซ้ำกัน

หลังจากที่เรา Cleaning Data เสร็จแล้ว เราไปทำ [Data Analysis](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/answer_question.md) เพื่อหาคำตอบที่เราสงสัยกันต่อเลย
