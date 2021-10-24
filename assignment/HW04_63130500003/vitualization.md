# Part 3 : Visualization with GGplot2
## 1. กราฟแสดงจำนวนหนังสือแต่ละประเภท
* `scale_fill_hue()` มาจาก package [ggplot2](https://www.r-graph-gallery.com/218-basic-barplots-with-ggplot2.html#color) เป็นฟังก์ชันสำหรับกำหนดความสว่างของสี ในที่นี้กำหนดให้มีความสว่างอยู่ที่ระดับ 40
```{R}
ggplot(Top_Book,aes(x=Type,fill=Type)) + geom_bar()+
  scale_fill_hue(c = 40) 
```
#### Result : จากกราฟจะเป็นได้ว่าหนังสือประเภท paper back มีจำนวนหนังสือมากที่สุด
![barGraph](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500003/graph/bar2.png)


## 2. กราฟแสดงความสัมพันธ์ระหว่างราคากับจำนวนการรีวิว
```{R}
Top_Book %>% ggplot(aes(x=Price,y=Reviews))+geom_point(aes(color=Price))
```
#### Result :จากกราฟจะเห็นได้ว่า ราคาของสินค้าไม่ขึ้นอยู่กับจำนวนรีวิว เนื่องจากกราฟไม่สัมพันธ์กัน
![scatter](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/assignment/HW04_63130500003/graph/Scatter.png)

# [Part B](https://app.powerbi.com/view?r=eyJrIjoiNjdhZWM1ZjMtNjUxZC00NDMyLWEyNzMtYmY1ZWE3OTMyMTEwIiwidCI6IjZmNDQzMmRjLTIwZDItNDQxZC1iMWRiLWFjMzM4MGJhNjMzZCIsImMiOjEwfQ%3D%3D&pageName=ReportSection)

กราฟที่ 1 : เป็นกราฟที่แสดงถึงจำนวนหนังสือในแต่ละประเภท<br>
กราฟที่ 2 : เป็นกราฟที่แสดงจำนวนของการรีวิว<br>
กราฟที่ 3 : เป็นกราฟที่แสดงถึง rating<br>
และจะมีการ์ดที่เอาไว้แสดงชื่อหนังสือ, คำอธิบาย และราคา

เมื่อเราคลิกไปที่กราฟแรกและเลือกมา 1 ประเภท กราฟที่ 2 และ 3 จะเปลี่ยนกราฟให้ตรงกับประเภทนั้นๆ แล้วในส่วนของราคาจะเป็นราคาเฉลี่ยของประเภทนั้น แต่หากคลกที่ชื่อหนึ่งสื่อตรงแกน x ของ กราฟ 2 และ 3 ในส่วนของราคาจะแสดงเป็นราคาของหนังสือเล่มนั้นๆ และจะแสดงชื่อหนังสือกับคำอธิบายของหนังสือเล่มนั้นๆด้วย
