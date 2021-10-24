library(dplyr)
library(readr)
library(data.table)
library(ggplot2)
library(isoband)
library(digest)

superstore <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

View(superstore)

glimpse(superstore)
superstore <- clean_names(superstore)
colnames(superstore)
head(superstore)

#1
superstore %>% select(customer_name ,category , sales ) %>%
  slice_max(sales , n=5 )

#3
superstore %>% select(category, sub_category ,product_name  , sales) %>% 
  filter(category == "Furniture" & sub_category == "Tables" & sales > 2500) %>% arrange(desc(sales)) 

#3
superstore %>% select(customer_name , sales) %>% 
  group_by(customer_name) %>% summarise(sumOfSales = sum(sales)) %>%
  slice_max(sumOfSales)

#4
superstore %>% select(category , sub_category ,sales) %>% 
  filter(sales > 8000 & category == 'Technology' & sub_category == 'Copiers' ) %>%
  arrange(desc(sales))

#5
superstore %>% select(ship_mode , category ,sales) %>% 
  filter(ship_mode == 'First Class' & sales > 4400) %>%
  arrange(desc(sales))

#6
superstore %>% select(region , category ,product_name , sales) %>% 
  filter(region == 'South' & category == 'Technology' & sales > 10000)

#Visualization 

#1
city_plot1 <- superstore %>% filter(sales > 8000 & category == 'Technology' & sub_category == 'Copiers' ) %>% 
  ggplot(aes(x=city,y=sales))+
  geom_point(aes(color=city))

city_plot1+ggtitle("Printer sales of each city over 8000")

#2
sub.category_plot <- superstore %>% filter(sales > 5000 & category == 'Technology' ) %>% 
  ggplot(aes(x=region)) + geom_bar()

sub.category_plot+ggtitle("The purchasing region of technology more than 5000 ") + xlab("Region") + ylab("SALES")

write.csv(superstore,"D:/R/superstore.csv", row.names=FALSE)
