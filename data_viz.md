# Data Visualization (BI Tools)

### Dashboard [click](https://app.powerbi.com/groups/me/reports/f688f1f4-1a71-4d45-a053-7a2c09819b87/ReportSection?ctid=6f4432dc-20d2-441d-b1db-ac3380ba633d)

![img](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/bi-final-ref.png)

### จากการใช้ Bi tool ในการสำรวจข้อมูล ทำให้ทราบข้อมูลดังนี้

1. จากกราฟ Streams by Release Month จะพบว่าในช่วงเดือนพฤษภาคมมีการเข้าใช้บริการบ่อยที่สุด ซึ่งเป็นไปได้ว่าหากศิลปินทำการปล่อยเพลงในเดือนนี้ จะทำให้เพลงได้รับความนิยมมากขึ้น 
2. จากกราฟ Popularity Chord จะทำให้ทราบว่าเพลงที่ติดอันดับ 200 อันดับแรก ส่วนใหญ่ใช้คอร์ด C#/Db เป็นคอร์ดหลักในการทำเพลง
3. จากกราฟ Popularity Genre พบว่าแนวเพลง dance pop, pop, post-teen pop เป็นที่นิยมมากที่สุด แต่แนวเพลง dance pop, edm, electro house, moombahton, pop, pop dance, pop rap เป็นแนวเพลงที่ได้รับความนิยมน้อยที่สุด หากศิลปินต้องการให้เพลงของตนเองได้รับความนิยม ก็อาจจะใช้ข้อมูลจากกราฟนี้เป็นการประกอบการตัดสินใจได้
4. จากกราฟ Artist Followers and Streams by Artist บอกได้ว่าความนิยมของเพลงไม่ได้ขึ้นอยู่กับจำนวนของผู้ติดตามของศิลปินนั้น
5. จาก Artist Followers สามารถบอกได้ว่าใน spotify มีจำนวนผู้ติดตามทั้งหมด 22.74 พันล้านคน ซึ่งเป็นจำนวนจาก 200 อันดับแรกของปี 2020 และ 2021
6. จากกราฟ Streams สามารถบอกได้ว่าใน spotify มีจำนวนการใช้บริการทั้งหมด 9.87 พันล้านครั้ง ซึ่งเป็นจำนวนจาก 200 อันดับแรกของปี 2020 และ 2021
7. จากกราฟ Streams by Song Name จะบอกจำนวนการสตรีมของแต่ละเพลง ซึ่งเพลง Beggin' มีจำนวนการสตรีมมากที่สุด จึงเป็นเพลงที่ได้รับความนิยมมากที่สุด

พวกเราได้เกิดข้อสงสัยกันว่าจำนวนครั้งที่สตรีมมีผลต่อการขึ้น Tops Chart หรือไม่ จึงได้ทำการ Analytical Inferential Statistics ด้วยวิธีการทำ [Hypothesis Testing](https://github.com/sit-2021-int214/001-Spotify-Top/blob/main/hypothesis_testing.md) 
