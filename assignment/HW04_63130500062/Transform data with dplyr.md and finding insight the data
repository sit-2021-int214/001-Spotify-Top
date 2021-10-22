## Transform data with dplyr and finding insight the data

1.) ลูกค้า 5 คนแรกที่มียอดการซื้อมากที่สุด :

```
superstore %>% select(customer_name ,category , sales ) %>%
  slice_max(sales , n=5 )
```

Result:

```
customer_name   category    sales
1   Sean Miller Technology 22638.48
2  Tamara Chand Technology 17499.95
3  Raymond Buch Technology 13999.96
4  Tom Ashbrook Technology 11199.97
5  Hunter Lopez Technology 10499.97
```
Explain : เพื่อหารายชื่อลูกค้าที่มีการใช้จ่ายมากที่สุดกับทางร้าน และหมวดหมู่ที่ซื้อไปเพื่อวิเคราะห์ว่าสินค้าประเภทใดที่ถูกซื้อเยอะที่สุด


2.) แสดงสินค้าประเภทโต๊ะ ที่มียอดขายมากกว่า 2500 : 

```
superstore %>% select(category, sub_category ,product_name  , sales) %>% 
  filter(category == "Furniture" & sub_category == "Tables" & sales > 2500) %>% arrange(desc(sales)) 
```

Result:

```
   category sub_category                                             product_name    sales
1 Furniture       Tables Chromcraft Bull-Nose Wood Oval Conference Tables & Bases 4297.644
2 Furniture       Tables               Bretford Rectangular Conference Table Tops 3610.848
3 Furniture       Tables            Bretford CR8500 Series Meeting Room Furniture 2887.056
4 Furniture       Tables                             Balt Solid Wood Round Tables 2678.940
5 Furniture       Tables                            Hon 94000 Series Round Tables 2665.620
```
Explain : เพื่อหาข้อมูลสินค้าเฟอร์นิเจอร์ประเภทโต๊ะ ที่มียอดขายเกิน 2500 เพื่อสามารถกระตุ้นยอดขายของทางร้านได้ถ้ารู้ชื่อสินค้าที่มียอดขายมากที่สุด

3.) แสดงชื่อลูกค้าที่มียอดการซื้อมากที่สุด : 

```
superstore %>% select(customer_name , sales) %>% 
  group_by(customer_name) %>% summarise(sumOfSales = sum(sales)) %>%
  slice_max(sumOfSales)
```

Result:

```
  customer_name   sumOfSales
                
1 Sean Miller       25043.
```
Explain : หาลูกค้าที่มียอดการใช้จ่ายมากที่สุดของร้าน

4.) หาข้อมูลเครื่องปริ้นเตอร์ที่มียอดขายมากกว่า 8000 เรียงจากมากไปน้อย

```
superstore %>% select(category , sub_category ,sales) %>% 
  filter(sales > 8000 & category == 'Technology' & sub_category == 'Copiers' ) %>%
  arrange(desc(sales))
```

Result:

```
category        sub_category     sales
1 Technology      Copiers     17499.950
2 Technology      Copiers     13999.960
3 Technology      Copiers     11199.968
4 Technology      Copiers     10499.970
5 Technology      Copiers      8399.976
```
Explain : แสดงข้อมูลของเครื่องปริ้นเตอร์ที่มียอดขายมากกว่า 8000 สามารถวิเคราะห์และกระตุ้นสินค้าประเภทเทคโนโลยีได้

5.) หาประเภทสินค้าที่ส่งชั้น First Class และมียอดขายมากกว่า 4400 :

```
superstore %>% select(ship_mode , category ,sales) %>% 
  filter(ship_mode == 'First Class' & sales > 4400) %>%
  arrange(desc(sales))
```

Result: 

```
     ship_mode   category     sales
1 First Class Technology 13999.960
2 First Class Technology 11199.968
3 First Class Technology  4799.984
```
Explain : แสดงสินค้าทุกประเภทที่มียอดขายมากกว่า 4400 และขนส่งชั้น First Class

6.) หาประเภทสินค้าและชื่อสินค้า ที่มียอดขายมากกว่า 10000 และภูืมภาคที่ซื้อด้วย

```
superstore %>% select(region , category ,product_name , sales) %>% 
  filter(region == 'South' & category == 'Technology' & sales > 10000)
```

Result:

```
 region   category                                          product_name    sales
1  South Technology Cisco TelePresence System EX90 Videoconferencing Unit 22638.48
```
Explain : แสดงภูมิภาคิที่มียอดซื้อมากกว่า 10000 แสดงประเภทสินค้าและชื่อของสินค้าเพื่อวิเคราะห์ภูมิภาคที่ซื้อเพื่อวิเคราะห์ประเภทของสินค้า
