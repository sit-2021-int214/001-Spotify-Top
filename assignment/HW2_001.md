# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) From cats, average of height cats is 10.63056 .
```{R}
colMeans(subset(cats,select=c(Hwt)))
```

2.) From cats, average of body weight is  2.723611 .
```{R}
colMeans(subset(cats,select=c(Bwt)))
```

3.) From cats, average body weight of  female cat  is  2.359574 .
```{R}
colMeans(subset(cats[1:47,],Sex=="F",select =c(Bwt))))
```

4.) From survey, the youngest student  is 16.75 years old.
```{R}
apply(subset(survey,select=c(Age)),2,min) 
```

5.) From survey, max Age is 73 years old .
```{R}
max(subset(survey,select=c(Age)))
```

6.) From survey, the data include 50 men over 19 years old .
```{R}
count(subset(survey,Sex == "Male" & Age > 19))
```

7.) From survey, the average of pulse that people tall more than 170 is 73.48352 . 
```{R}
mean(((subset(survey, Height > 170 ))$Pulse),na.rm=TRUE)
```

8.) From survey, the number of  people that smoke heavy is 11 .
```{R}
 count(subset(survey,Smoke == 'Heavy'))
```

### Team: #ทีมกัสชนะ
1. นางสาวกัญญาพัชร วิทยามานิตย์กุล   StudentID: 63130500003
2. นายธีรุตม์ ทันการ                StudentID: 63130500062
3. นางสาวบุรัสกร บุญมา	           StudentID: 63130500074
