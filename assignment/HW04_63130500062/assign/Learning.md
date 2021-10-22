## Part 2: Learning function from Tidyverse
- arrange() changes the ordering of the rows.

```
superstore %>% select(sales) %>% arrange(desc(sales))
```
- filter() picks cases based on their values.
```
superstore %>% select(Product.Name,Sub.Category) %>% filter(Sub.Category == 'Tables')
```
- summarise() reduces multiple values down to a single summary.
```
superstore %>% summarise(sumOfSales = sum(Sales))
```
[TransformData](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500062/assign/TransformData.md)
