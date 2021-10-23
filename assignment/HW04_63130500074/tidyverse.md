# Part 2: Learning function from Tidyverse

- Function `distinct()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html). It using for select distinct data in columns that you choose.
- Function `relocate()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html). It using for locate column the you want into front
- Function `pull()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html). It using for extract data with single values.
- Function `slice()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html). It using for slice columns that you choose.
- Function `mutate()` from package [dplyr](https://dplyr.tidyverse.org/articles/base.html). It using for mutate columns that means add one column right.

## Example Code
1. ใช้ Function `distinct()` เพื่อราคาหนังสือที่ไม่ซ้ำกันเลย
```{R}
prog_book %>% distinct(Price)
```
Result : 
```{R}
Price
   <dbl>
 1  9.32
 2 11   
 3 11.3 
 4 12.9 
 5 13.2 
 6 14.2 
 7 14.2 
 8 14.4 
 9 14.5 
10 14.6 
# … with 231 more rows
```
2. ใช้ Function `relocate()` เพื่อย้ายคอลัมน์ Book_title,Price มาไว้ด้านหน้า
```{R}
prog_book %>% relocate(Book_title,Price)
```
Result : 
```{R}
# A tibble: 271 × 7
   Book_title     Price Rating Reviews Description     Number_Of_Pages Type 
   <chr>          <dbl>  <dbl>   <dbl> <chr>                     <dbl> <chr>
 1 The Elements …  9.32   4.17    3829 "This style ma…             105 Hard…
 2 The Informati… 11      4.01    1406 "James Gleick,…             527 Hard…
 3 Responsive We… 11.3    3.33       0 "In Responsive…              50 Kind…
 4 Ghost in the … 12.9    3.97    1658 "If they were …             393 Hard…
 5 How Google Wo… 13.2    4.06    1325 "Both Eric Sch…             305 Kind…
 6 The Meme Mach… 14.2    3.84     117 "What is a mem…             288 Pape…
 7 Start with Wh… 14.2    4.09    5938 "Why do you do…             256 Hard…
 8 Algorithms to… 14.4    4.15    1817 "A fascinating…             368 Hard…
 9 Weapons of Ma… 14.5    3.87    2093 "A former Wall…             259 Hard…
10 ZX Spectrum G… 14.6    4.62       0 "This book is …             128 Pape…
# … with 261 more rows
```
3. ใช้ Function `filter()` เพื่อเลือกข้อมูลเฉพาะราคาที่มีราคามากกว่าค่าเฉลี่ย
```{R}
prog_book %>% pull(Rating)
```
Result : 
```{R}
  [1] 4.17 4.01 3.33 3.97 4.06 3.84 4.09 4.15 3.87 4.62 4.03 3.78 3.73 3.87
 [15] 3.87 3.95 3.85 3.94 3.75 4.10 4.22 3.71 4.21 4.28 3.20 3.67 3.97 3.98
 [29] 3.96 4.37 4.25 4.32 4.01 4.13 4.15 3.91 3.86 4.03 4.23 4.04 4.09 4.33
 [43] 4.09 3.93 4.00 4.27 3.84 4.20 4.06 3.65 4.08 4.15 4.01 4.06 5.00 4.12
 [57] 4.35 4.11 4.35 4.11 3.32 4.00 3.97 4.28 3.91 3.68 3.78 4.40 4.04 4.15
 [71] 4.02 3.76 4.15 3.60 4.16 4.27 4.05 3.68 4.16 4.34 4.11 4.39 3.88 3.70
 [85] 3.83 4.11 3.22 4.31 4.31 4.27 4.05 4.28 4.43 4.50 3.38 3.87 4.29 3.97
 [99] 4.25 3.89 4.29 4.20 3.78 4.54 4.34 4.49 4.11 4.15 3.82 4.40 3.97 4.02
[113] 3.58 3.75 4.67 4.33 4.20 4.30 3.73 4.29 3.86 3.82 4.04 4.28 4.20 4.50
[127] 3.98 3.83 4.18 3.96 3.67 4.72 3.37 4.25 4.03 4.13 3.93 4.62 4.40 4.17
[141] 4.08 4.08 3.79 4.22 4.23 4.14 4.54 3.58 4.00 4.40 4.21 3.93 4.11 4.34
[155] 4.08 3.83 4.18 4.23 4.23 4.12 4.28 4.18 4.15 3.93 4.33 4.22 3.91 4.18
[169] 4.21 4.25 4.35 4.25 4.19 4.24 4.46 4.46 4.00 3.00 3.83 4.16 4.14 4.10
[183] 3.00 4.18 3.52 4.13 4.12 3.00 4.22 4.37 4.21 4.37 3.88 3.70 4.67 4.21
[197] 3.87 4.05 4.58 3.92 4.20 4.00 4.32 3.96 3.95 4.42 4.08 4.00 3.96 4.31
[211] 4.15 4.23 4.13 3.56 4.30 3.78 4.41 3.86 4.24 4.23 4.33 4.25 4.05 4.34
[225] 4.15 3.94 3.59 3.48 4.45 4.02 4.03 3.92 3.77 3.91 4.25 4.14 4.23 4.00
[239] 4.01 4.03 4.33 4.06 3.97 4.37 4.10 4.35 4.37 3.90 4.02 4.03 4.10 4.42
[253] 4.11 4.11 3.96 3.67 4.13 3.87 4.16 4.18 3.45 3.82 4.08 3.77 3.82 4.26
[267] 3.76 3.94 4.49 4.77 3.84
```
4. ใช้ Function `slice()` เพื่อเลือกข้อมูลเฉพาะแถวที่ 1 ถึง 5 
```{R}
prog_book %>% slice(1:5)
```
Result : 
```{R}
Rating Reviews Book_title               Description                     Number_Of_Pages Type    Price
   <dbl>   <dbl> <chr>                    <chr>                                     <dbl> <chr>   <dbl>
1   4.17    3829 The Elements of Style    "This style manual offers prac…             105 Hardco…  9.32
2   4.01    1406 The Information: A Hist… "James Gleick, the author of t…             527 Hardco… 11   
3   3.33       0 Responsive Web Design O… "In Responsive Web Design Over…              50 Kindle… 11.3 
4   3.97    1658 Ghost in the Wires: My … "If they were a hall of fame o…             393 Hardco… 12.9 
5   4.06    1325 How Google Works         "Both Eric Schmidt and Jonatha…             305 Kindle… 13.2 
```
5. ใช้ Function `mutate()` เพื่อเลือกข้อมูลเฉพาะราคาที่มีราคามากกว่าค่าเฉลี่ย
```{R}
prog_book %>% mutate(Price/Number_Of_Pages)
```
Result : 
```{R}
# A tibble: 271 × 8
   Rating Reviews Book_title         Description          Number_Of_Pages Type   Price `Price/Number_O…
    <dbl>   <dbl> <chr>              <chr>                          <dbl> <chr>  <dbl>            <dbl>
 1   4.17    3829 The Elements of S… "This style manual …             105 Hardc…  9.32           0.0888
 2   4.01    1406 The Information: … "James Gleick, the …             527 Hardc… 11              0.0209
 3   3.33       0 Responsive Web De… "In Responsive Web …              50 Kindl… 11.3            0.225 
 4   3.97    1658 Ghost in the Wire… "If they were a hal…             393 Hardc… 12.9            0.0328
 5   4.06    1325 How Google Works   "Both Eric Schmidt …             305 Kindl… 13.2            0.0432
 6   3.84     117 The Meme Machine   "What is a meme? Fi…             288 Paper… 14.2            0.0493
 7   4.09    5938 Start with Why: H… "Why do you do what…             256 Hardc… 14.2            0.0556
 8   4.15    1817 Algorithms to Liv… "A fascinating expl…             368 Hardc… 14.4            0.0390
 9   3.87    2093 Weapons of Math D… "A former Wall Stre…             259 Hardc… 14.5            0.0560
10   4.62       0 ZX Spectrum Games… "This book is ideal…             128 Paper… 14.6            0.114
```

