# R-Assignment 4

**Created by Buratsakorn Boonma (ID: 63130500074)**

Choose Dataset:
1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```{R}
# Library
library(readr)
library(assertive)
library(stringr)
library(dplyr)

# Dataset
prog_book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
glimpse(prog_book)
summary(prog_book)

prog_book %>% head()
prog_book %>% View()
str(prog_book)
```

In this dataset has .....
Book_title  :
Description :
Type  :
Rating  : 
Number_Of_Pages :
Price :


## Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

```{R}
prog_book %>% select(Rating,Book_title)
prog_book %>% select(Book_title,Price)
prog_book %>% arrange(desc(Price))
prog_book %>% arrange(desc(Rating))
prog_book %>% filter(Price > mean(Price, na.rm = TRUE))
prog_book %>% slice(1:5)
```
** You can sepearate this part or combine in part of `Transform data with dplyr and finding insight the data`

## Part 3: Transform data with dplyr and finding insight the data

1.หนังสือที่มี Rating เกินกว่าค่าเฉลี่ย

```{R}
#Code here
```

Result:
```{R}


#Copy Result from console to here
```
//Explain

- list 1
- list 2

## Part 4: Visualization with GGplot2
### 1.) Graph show relation between height and mass
```
scat_plot <- starwars %>% filter(mass<500) %>% ggplot(aes(x=height,y=mass))+
  geom_point(aes(color=gender))

scat_plot+geom_smooth()
```
Result:

![Graph 1](graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
