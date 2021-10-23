# Part 4: Visualization with GGplot2
### 1.) Graph show relation between Price and Number_Of_Pages
```{R}
scat_plot <- prog_book %>% filter(Price<100) %>% ggplot(aes(x=Price,y=Number_Of_Pages))+
  geom_point(aes(color=Type))
scat_plot+geom_smooth()
```
Result:

![Graph 1](Graph1.png)

**Guideline:
Embed Image by using this syntax in markdown file
````
![Name](imageFile)
````
