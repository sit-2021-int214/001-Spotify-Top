# Part 2 : Learning function from Tidyverse & <br>Transform data with dplyr and finding insight the data
### 1. หนังสือเล่มใดมีจำนวนการรีวิวมากที่สุด 3 อันดับ
#### Code :
```{R}
Top_Book %>% select(Book_title, Reviews) %>%
  slice_max(Reviews, n=3)
```
#### Result :
```{R}
  Book_title                                                                   Reviews
  <chr>                                                                          <dbl>
1 Start with Why: How Great Leaders Inspire Everyone to Take Action               5938
2 The Elements of Style                                                           3829
3 The Phoenix Project: A Novel About IT, DevOps, and Helping Your Business Win    2629
```
### 2. หนังสือเล่มใดบ้างที่ไม่มีการรีวิวเลย
#### Code :
```{R}
Top_Book %>% select(Book_title, Reviews) %>%
  filter(Reviews == 0)
```
#### Result :
```{R}
 Book_title                                                                             Reviews
   <chr>                                                                                    <dbl>
 1 Responsive Web Design Overview For Beginners                                                 0
 2 ZX Spectrum Games Code Club: Twenty fun games to code and learn                              0
 3 Game Programming Golden Rules                                                                0
 4 Beginners Guide On PHP Programming: Quick And Easy Guide To Learn PHP With My-SQL            0
 5 Python Programming Books Set: Python Programming for Beginners & Complete Guide for P~       0
 6 Your First App: Node.js                                                                      0
 7 Python Programming For Beginners: Quick And Easy Guide For Python Programmers                0
 8 Building an FPS Game with Unity                                                              0
 9 Advanced Game Programming: A Gamedev.Net Collection                                          0
10 Basic Proof Theory                                                                           0
# ... with 12 more rows
```
### 3. หนังสือเล่มใดมีจำนวนการรีวิวมากกว่าค่าเฉลี่ย
#### Code :
```{R}
Top_Book %>% select(Book_title,Rating) %>%
  filter(Rating > mean(Rating)) %>%
  arrange(desc(Rating))
```
#### Result :
```{R}
 Book_title                                                                              Rating
   <chr>                                                                                    <dbl>
 1 Your First App: Node.js                                                                   5   
 2 The Art of Computer Programming, Volumes 1-4a Boxed Set                                   4.77
 3 Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Ma~   4.72
 4 Build Web Applications with Java: Learn every aspect to build web applications from sc~   4.67
 5 Fluent Python: Clear, Concise, and Effective Programming                                  4.67
 6 ZX Spectrum Games Code Club: Twenty fun games to code and learn                           4.62
 7 The Linux Programming Interface: A Linux and Unix System Programming Handbook             4.62
 8 CLR via C# (Developer Reference)                                                          4.58
 9 The Elements of Computing Systems: Building a Modern Computer from First Principles       4.54
10 Practical Object Oriented Design in Ruby                                                  4.54
# ... with 137 more rows
```
### 4. แต่ละประเภทมีหนังสือกี่เล่ม
#### Code :
```{R}
count(Top_Book,Type)
```
#### Result :
```{R}
Type                      n
  <chr>                 <int>
1 Boxed Set - Hardcover     1
2 ebook                     7
3 Hardcover                95
4 Kindle Edition           10
5 Paperback               156
6 Unknown Binding           2
```
### 5. หนังสือที่มีราคามากที่สุด มีจำนวนหน้าเท่าไหร่
#### Code :
```{R}
Top_Book %>% select(Book_title, Number_Of_Pages ,Price) %>%
  slice_max(Price)
```
#### Result :
```{R}
 Book_title                            Number_Of_Pages Price
  <chr>                                           <dbl> <dbl>
1 A Discipline for Software Engineering             789  236.
```
### 6. หนังสือที่มี rating มากกว่า 4.5 เล่มใดมีราคาถูกที่สุด
#### Code :
```{R}
Top_Book %>% select(Book_title, Rating, Price) %>%
  filter(Rating > 4.5) %>% slice_min(Price)
```
#### Result :
```{R}
 Book_title                                                      Rating Price
  <chr>                                                            <dbl> <dbl>
1 ZX Spectrum Games Code Club: Twenty fun games to code and learn   4.62  14.6
```
