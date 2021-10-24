# Part 3 : Visualization with GGplot2
## 1. กราฟแสดงจำนวนหนังสือแต่ละประเภท
```{R}
ggplot(Top_Book,aes(x=Type,fill=Type)) + geom_bar()+
  scale_fill_hue(c = 40) +
  theme(legend.position="none")
```
#### Result :
![barGraph](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500003/graph/bar.png)

## 2. กราฟแสดงความสัมพันธ์ระหว่างราคากับจำนวนการรีวิว
```{R}
Top_Book %>% ggplot(aes(x=Price,y=Reviews))+geom_point(aes(color=Price))
```
#### Result :
![scatter](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500003/graph/Scatter.png)
