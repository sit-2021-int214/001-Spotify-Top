## Step 1). Define a question
เนื่องจากสมาชิกภายในกลุ่มชอบฟังเพลงบน spotify จึงเกิดคำถามภายในกลุ่มว่า spotify จัดอันดับเพลงที่จะเอาขึ้น charts อย่างไร มีอะไรที่เป็นองค์ประกอบในการจัดอันดับบ้าง และเพลงที่ได้รับความนิยมส่วนใหญ่จะเป็นเพลงแนวไหน อย่างไร

## Step 2). Search datasets from Kaggle
พวกเราจึงได้หาข้อมูลที่เกี่ยวกับการเก็บข้อมูลต่าง ๆ ในการขึ้น charts ของ spotify จาก [kaggle](https://www.kaggle.com/sashankpillai/spotify-top-200-charts-20202021)<br>
ก่อนอื่นเราจะต้องเรียกใช้ library ที่จำเป็นก่อน
#### Library
```{R}
library(readr)
library(assertive)
library(stringr)
library(dplyr)
```
หลังจากนั้นก็ใช้ `read_csv()` เพื่อ import dataset
```{R}
spotify_tops <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/001-Spotify-Top/main/spotify_dataset_original.csv")
```
ผลลัพธ์ที่ได้
```{R}
Rows: 1556 Columns: 23                                                              
 0s-- Column specification --------------------------------------------------------------
Delimiter: ","
chr  (8): Week of Highest Charting, Song Name, Artist, Song ID, Genre, Release Dat...
dbl (14): Index, Highest Charting Position, Number of Times Charted, Artist Follow...
```

## Data Exploration
ข้อมูลชุดนี้เป็นข้อมูลเพลงต่าง ๆ ที่ได้ขึ้น charts ของ spotify ซึ่งจัดอันดับ 200 อันดับแรกของแต่ละสัปดาห์ในช่วงปี 2020 ถึง 2021 <br>
dataset นี้ ประกอบไปด้วยเพลงทั้งหมด 1,556 เพลง และมีตัวแปร 23 ตัว โดยใช้คำสั่ง `glimpse()` เพื่อใช้ในการตรวจสอบ 
```{R}
glimpse(spotify_tops)
```
ผลลัพธ์ที่ได้จะบอกประเภทข้อมูลของตัวแปรนั้น ๆ ด้วย
```{R}
Rows: 1,556
Columns: 23
$ Index                       <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 1~
$ `Highest Charting Position` <dbl> 1, 2, 1, 3, 5, 1, 3, 2, 3, 8, 4, 9, 5, 1, 2, 7, ~
$ `Number of Times Charted`   <dbl> 8, 3, 11, 5, 1, 18, 16, 10, 8, 10, 43, 9, 3, 19,~
$ `Week of Highest Charting`  <chr> "2021-07-23--2021-07-30", "2021-07-23--2021-07-3~
$ `Song Name`                 <chr> "Beggin'", "STAY (with Justin Bieber)", "good 4 ~
$ Streams                     <dbl> 48633449, 47248719, 40162559, 37799456, 33948454~
$ Artist                      <chr> "Måneskin", "The Kid LAROI", "Olivia Rodrigo", "~
$ `Artist Followers`          <dbl> 3377762, 2230022, 6266514, 83293380, 5473565, 54~
$ `Song ID`                   <chr> "3Wrjm47oTz2sjIgck11l5e", "5HCyWlXZPP0y6Gqq8TgA2~
$ Genre                       <chr> "['indie rock italiano', 'italian pop']", "['aus~
$ `Release Date`              <chr> "2017-12-08", "2021-07-09", "2021-05-21", "2021-~
$ `Weeks Charted`             <chr> "2021-07-23--2021-07-30\n2021-07-16--2021-07-23\~
$ Popularity                  <dbl> 100, 99, 99, 98, 96, 97, 94, 95, 96, 95, 89, 95,~
$ Danceability                <dbl> 0.714, 0.591, 0.563, 0.808, 0.736, 0.610, 0.762,~
$ Energy                      <dbl> 0.800, 0.764, 0.664, 0.897, 0.704, 0.508, 0.701,~
$ Loudness                    <dbl> -4.808, -5.484, -5.044, -3.712, -7.409, -6.682, ~
$ Speechiness                 <dbl> 0.0504, 0.0483, 0.1540, 0.0348, 0.0615, 0.1520, ~
$ Acousticness                <dbl> 0.12700, 0.03830, 0.33500, 0.04690, 0.02030, 0.2~
$ Liveness                    <dbl> 0.3590, 0.1030, 0.0849, 0.3640, 0.0501, 0.3840, ~
$ Tempo                       <dbl> 134.002, 169.928, 166.928, 126.026, 149.995, 178~
$ `Duration (ms)`             <dbl> 211560, 141806, 178147, 231041, 212000, 137876, ~
$ Valence                     <dbl> 0.5890, 0.4780, 0.6880, 0.5910, 0.8940, 0.7580, ~
$ Chord                       <chr> "B", "C#/Db", "A", "B", "D#/Eb", "G#/Ab", "G#/Ab~
```
ซึ่งแต่ละตัวแปรมีความหมาย ดังนี้

* Highest Charting Position : อันดับสูงสุดในการติด charts ของเพลงนั้น ๆ 
* Number of Times Charted : จำนวนครั้งที่เพลงนั้นติด charts
* Week of Highest Charting : สัปดาห์ที่เพลงอยู่อันดับสูงสุดของ charts ข้อมูลเป็นช่วงวันที่ของแต่ละสัปดาห์
* Song Name : ชื่อเพลง
* Streams : จำนวนการฟังเพลง
* Artist : ศิลปินหลักที่ทำเพลงนั้น
* Artist Followers : ยอดผู้ติดตามบน spotify ของศิลปินที่ทำเพลง
* Song ID : ID ของเพลงที่ spotify ให้มา โดยจะเป็น ID เฉพาะของเพลง ไม่ซ้ำกัน
* Genre : ประเภทของเพลง ซึ่งในแต่ละเพลงจะเก็บข้อมูลหลายประเภท
* Release Date : วันที่ปล่อยเพลง
* Week Charted : สัปดาห์ที่เพลงนั้นติด charts ข้อมูลเป็นช่วงวันที่ของแต่ละสัปดาห์
* Popularity : ค่าความนิยมของ track โดยค่านั้นจะมีค่าระหว่าง 0 ถึง 100 ซึ่ง 100 จะแสดงว่าได้รับความนิยมมากที่สุด
* Danceability : แสดงค่าที่บอกว่าเพลงนั้นสามารถเต้นได้มากน้อยเพียงใด โดยค่านี้จะพิจารณาจากองค์ประกอบทางดนตรี เช่น จังหวะ ความแรงของบีต ซึ่งค่า 0.0 จะสามารถเต้นได้น้อยที่สุด และค่า 1.0 จะสามารถเต้นได้มากที่สุด
* Loudness : ค่าเฉลี่ยความดังของทั้ง track ซึ่งมีหน่วยเป็น decibels ซึ่งโดยทั่วไปค่าจะอยู่ที่ -60 ถึง 0 decibels
* Tempo : อัตราความเร็ว มีหน่วยเป็นบีตต่อนาที (BPM)
* Valence : เป็นค่าที่อธิบายถึงความรู้สึกของเพลง ค่า valence จะอยู่ที่ 0.0 ถึง 1.0 โดยถ้ามีค่า valance สูงจะแสดงว่าเพลงนั้นจะให้อารมณ์เพลงที่เป็นบวกมากกว่า เช่น มีความสุข ร่าเริง แต่ถ้ามีค่า valence ต่ำจะแสดงว่าเพลงนั้นให้อารมณ์เพลงที่เป็นลบมากกว่า เช่น เศร้า หดหู่ โกรธ
* Chord : chord หลักของเพลง 
<br><br>

หลังจากที่ได้ทำการสำรวจ dataset แล้ว พวกเราก็ได้เกิดคำถามเพิ่มเติมอีกมากมาย ได้แก่
1. อยากทราบว่าเพลงของศิลปินคนไหนติด charts บ่อยที่สุด ?
2. เพลง 3 อันดับแรก ที่มีจำนวนการสตรีมสูงสุด ?
3. เพลงที่มีจำนวนครั้งในการขึ้น charts มากที่สุด ?
4. ค่าเฉลี่ยของ loudness เพลงที่ charts ?
5. chord ใด ที่นิยมนำมาใช้ในเพลงที่ติด charts มากที่สุด ?
6. มีเพลงใดบ้างที่ติด charts แต่ มี loundness ไม่อยู่ในค่าเฉลี่ย ?
7. เพลงใดบ้างที่อยู่ต่ำกว่าค่าเฉลี่ยของ Tempo
8. ศิลปินคนใดมียอดผู้ติดตามบน spotify มากที่สุด

ก่อนที่เราจะไปหาคำตอบของคำถามที่เราสงสัย เราจะต้องทำการ [clean data](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/data_cleaning.md) กันก่อน
