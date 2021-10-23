# Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns.
- Function `arrange()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for arrange data that you want such as asc desc in sql.
- Function `filter()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for filter data that you want to see .
- Function `slice()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for slice columns that you choose.
- Function `mutate()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for mutate columns that means add one column right.

## Example Code
1. ใช้ Function `select()` เพื่อเลือกชื่อหนังสือและราคาหนังสือ
```{R}
prog_book %>% select(Book_title,Price)
```
Result : 
```{R}
# A tibble: 271 × 2
   Book_title                                                                             Price
   <chr>                                                                                  <dbl>
 1 The Elements of Style                                                                   9.32
 2 The Information: A History, a Theory, a Flood                                          11   
 3 Responsive Web Design Overview For Beginners                                           11.3 
 4 Ghost in the Wires: My Adventures as the World's Most Wanted Hacker                    12.9 
 5 How Google Works                                                                       13.2 
 6 The Meme Machine                                                                       14.2 
 7 Start with Why: How Great Leaders Inspire Everyone to Take Action                      14.2 
 8 Algorithms to Live By: The Computer Science of Human Decisions                         14.4 
 9 Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy 14.5 
10 ZX Spectrum Games Code Club: Twenty fun games to code and learn                        14.6 
# … with 261 more rows
```
2. ใช้ Function `arrange()` เพื่อเรียงราคาหนังสือจากมากไปน้อย 
```{R}
prog_book %>% arrange(desc(Price))
```
Result : 
```{R}
# A tibble: 271 × 7
   Rating Reviews Book_title                  Description                 Number_Of_Pages Type    Price
    <dbl>   <dbl> <chr>                       <chr>                                 <dbl> <chr>   <dbl>
 1   3.84       5 A Discipline for Software … "Designed to help individu…             789 Hardco…  236.
 2   4.49      36 The Art of Computer Progra… "Knuth's classic work has …             896 Boxed …  220.
 3   4.77       4 The Art of Computer Progra… "\"The bible of all fundam…            3168 Hardco…  220.
 4   3.94      22 An Introduction to Databas… "Continuing in the eighth …            1040 Paperb…  212.
 5   3.76       0 3D Game Engine Architectur… "Dave Eberly's 3D Game Eng…             752 Hardco…  203.
 6   4.26       5 Numerical Recipes: The Art… "Co-authored by four leadi…            1235 Hardco…  176.
 7   3.82       0 Game Programming Gems 3     "The journey continues wit…             663 Hardco…  143.
 8   3.77       0 Game Programming Gems 4     "Uncover the secrets of th…             703 Hardco…  139.
 9   4.08      56 Compilers: Principles, Tec… "This introduction to comp…             796 Hardco…  127.
10   3.82       0 Game Programming Gems 6     "Welcome to the sixth volu…             700 Hardco…  119.
# … with 261 more rows
```
3. ใช้ Function `filter()` เพื่อเลือกข้อมูลเฉพาะราคาที่มีราคามากกว่าค่าเฉลี่ย
```{R}
prog_book %>% filter(Price > mean(Price, na.rm = TRUE))
```
Result : 
```{R}
# A tibble: 105 × 7
   Rating Reviews Book_title                   Description                  Number_Of_Pages Type  Price
    <dbl>   <dbl> <chr>                        <chr>                                  <dbl> <chr> <dbl>
 1   3.91      57 Effective Programming: More… "Jeff Atwood began the Codi…             283 ebook  54.7
 2   4.18     302 Building Microservices: Des… "Distributed systems have b…             262 Pape…  54.9
 3   4.21       8 Exceptional C++: 47 Enginee… "Exceptional C++ shows by e…             208 Pape…  56.1
 4   4.25       1 Reviewing Java               "Reviewing Java provides yo…             658 Pape…  56.6
 5   4.35       2 Microsoft Visual C# Step by… "Your hands-on guide to Mic…             816 Pape…  56.6
 6   4.25     275 Refactoring: Improving the … "As the application of obje…             431 Hard…  57.2
 7   4.19     116 Growing Object-Oriented Sof… "Foreword by Kent Beck \"Th…             345 Pape…  57.2
 8   4.24      26 Modern C++ Design: Generic … "In Modern C++ Design, Andr…             360 Pape…  58.4
 9   4.46     164 Structure and Interpretatio… "Structure and Interpretati…             657 Pape…  58.9
10   4.46     164 Structure and Interpretatio… "There are new implementati…             657 Hard…  58.9
# … with 95 more rows
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

