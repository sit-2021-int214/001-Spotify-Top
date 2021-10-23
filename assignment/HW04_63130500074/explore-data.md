# Part 1: Explore the dataset
## Import Library

```{R}
# Library
library(readr)
library(assertive)
library(stringr)
library(dplyr)
```
## Import Dataset
```{R}
prog_book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```
explore dataset
```{R}
glimpse(prog_book)
```
result
```{R}
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73,…
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 33, 1255, 593,…
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Re…
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throu…
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288…
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "P…
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 1…
```
summay dataset
```{R}
summary(prog_book)
```
Result :
```{R}
  Rating         Reviews        Book_title        Description        Number_Of_Pages 
 Min.   :3.000   Min.   :   0.0   Length:271         Length:271         Min.   :  50.0  
 1st Qu.:3.915   1st Qu.:   5.5   Class :character   Class :character   1st Qu.: 289.0  
 Median :4.100   Median :  35.0   Mode  :character   Mode  :character   Median : 384.0  
 Mean   :4.067   Mean   : 185.6                                         Mean   : 475.1  
 3rd Qu.:4.250   3rd Qu.: 116.5                                         3rd Qu.: 572.5  
 Max.   :5.000   Max.   :5938.0                                         Max.   :3168.0  
     Type               Price        
 Length:271         Min.   :  9.324  
 Class :character   1st Qu.: 30.751  
 Mode  :character   Median : 46.318  
                    Mean   : 54.542  
                    3rd Qu.: 67.854  
                    Max.   :235.650  
```
explore dataset
```{R}
prog_book %>% head()
prog_book %>% View()
str(prog_book)
```

In this dataset has .....
* Book_title  : ชื่อหนังสือ หัวข้อเรื่องของหนังสือ
* Description : คำอธิบายเกี่ยวกับหนังสือ รายละเอียดหนังสือ
* Type  : ประเภทของหนังสือ 
* Rating  : คะแนนการประเมินของหนังสือ
* Number_Of_Pages : จำนวนหน้าหนังสือ
* Price : ราคาของหนังสือ

ไปต่อกันที่ Part 2 : [Learning function from Tidyverse](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500074/tidyverse.md)
