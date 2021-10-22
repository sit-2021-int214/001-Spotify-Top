# Explore the dataset
### Step 1 : ทำการเรียกใช้ library และ import dataset
```{R}
#Library
library(dplyr)
library(readr)
library(ggplot2)

#Dataset
Top_Book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```
เมื่อ run แล้ว จะได้ผลลัพธ์ ตามนี้
```{R}
Rows: 271 Columns: 7                                                                
 0s-- Column specification --------------------------------------------------------------
Delimiter: ","
chr (3): Book_title, Description, Type
dbl (3): Rating, Number_Of_Pages, Price

i Use `spec()` to retrieve the full column specification for this data.
i Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

### Step 2 : ดูว่ามีข้อมูลอะไรใน dataset บ้าง
```{R}
glimpse(Top_Book)
```
#### Result
```{R}
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, ~
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 48~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theo~
$ Description     <chr> "This style manual offers practical advice on improving writ~
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 2~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Ki~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188~
```
จากผลลัพธ์ด้านบนจะเห็นได้ว่ามีข้อมูลทั้งหมด 271 ข้อมูล และตัวแปรทั้งหมด 7 ตัว ซึ่งแต่ละตัวแปรมีความหมาย ดังนี้
* Rating :
* Review :
* Book_title :
* Description :
* Number_Of_Pages :
* Type :
* Price :
