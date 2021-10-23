# Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns
- Function `arrange()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns
- Function `filter()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns
- Function `slice()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

## Example Code
```{R}
prog_book %>% select(Rating,Book_title)
```
```{R}
prog_book %>% select(Book_title,Price)
```
```{R}
prog_book %>% arrange(desc(Price))
```
```{R}
prog_book %>% arrange(desc(Rating))
```
```{R}
prog_book %>% filter(Price > mean(Price, na.rm = TRUE))
```
```{R}
prog_book %>% slice(1:5)
```
