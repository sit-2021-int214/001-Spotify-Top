## Part 4: Visualization with GGplot2
### 
1.) Graph show relation between height and mass
```
city_plot1 <- superstore %>% filter(sales > 8000 & category == 'Technology' & sub_category == 'Copiers' ) %>% 
  ggplot(aes(x=city,y=sales))+
  geom_point(aes(color=city))

city_plot1+ggtitle("Printer sales of each city over 8000")
```
- Result :

     ![Dot](https://github.com/sit-2021-int214/001-Spotify-Top/blob/559d53472e5c058149d624e7c44e0c6349a0c7a2/assignment/HW04_63130500062/dot.png)

 2.) Graph show relation between height and mass
```
sub.category_plot <- superstore %>% filter(sales > 5000 & category == 'Technology' ) %>% 
  ggplot(aes(x=region)) + geom_bar()

sub.category_plot+ggtitle("The purchasing region of technology more than 5000 ") + xlab("Region") + ylab("SALES")
```
- Result : 

    ![Boxplot](https://github.com/sit-2021-int214/001-Spotify-Top/blob/559d53472e5c058149d624e7c44e0c6349a0c7a2/assignment/HW04_63130500062/boxplot.png)
    
    