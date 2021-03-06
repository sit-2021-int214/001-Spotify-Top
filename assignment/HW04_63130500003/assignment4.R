library(dplyr)
library(readr)
library(ggplot2)

Top_Book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(Top_Book)

Top_Book %>% select(Book_title, Reviews) %>%
  slice_max(Reviews, n=3)

Top_Book %>% select(Book_title, Reviews) %>%
  filter(Reviews == 0)

Top_Book %>% select(Book_title,Rating) %>%
  filter(Rating > mean(Rating)) %>%
  arrange(desc(Rating))

mean(Top_Book$Rating) #4.067417

numType <- count(Top_Book,Type) #???????????????????????????????????????????????????????????????
numType %>% arrange(desc(n)) #?????????????????????????????????????????????????????????????????????????????????

Top_Book %>% select(Book_title, Number_Of_Pages ,Price) %>%
  slice_max(Price)

Top_Book %>% select(Book_title, Rating, Price) %>%
  filter(Rating > 4.5) %>% slice_min(Price)

ratingMore<- Top_Book %>% filter(Rating > 4.5) 
count(ratingMore)

ggplot(Top_Book,aes(x=Type,fill=Type)) + geom_bar()+
  scale_fill_hue(c = 40)

Top_Book %>% ggplot(aes(x=Price,y=Reviews))+geom_point(aes(color=Price))


