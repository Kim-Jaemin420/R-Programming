library(readxl)

dustdata <- read_excel("dustdata.xlsx")

# View = 뷰어 창에서 데이터 확인
View(dustdata)
# str = 데이터에 들어있는 변수 속성 확인
str(dustdata)

library(dplyr)

dustdata_anal <- dustdata %>% filter(area %in% c("종로구", "중구"))

View(dustdata_anal)

# dustdata_anal 데이터 세트에 yyyymmdd에 따른 데이터 수 파악
count(dustdata_anal, yyyymmdd) %>% arrange(desc(n))
# dustdata_anal 데이터 세트에 area에 따른 데이터 수 파악
count(dustdata_anal, area) %>% arrange(desc(n))

# area 값이 종로구인 데이터를 dust_anal_area_jn에 할당
dust_anal_area_jn <- subset(dustdata_anal, area == '종로구')
# area 값이 성북구인 데이터를 dust_anal_area_sb에 할당
dust_anal_area_jg <- subset(dustdata_anal, area == '중구')

dust_anal_area_jn
dust_anal_area_sb


library(psych)

describe(dust_anal_area_jn$finedust)
describe(dust_anal_area_jg$finedust)


boxplot(dust_anal_area_jn$finedust, dust_anal_area_jg$finedust,
        main = "finedust_compare", xlab = "AREA", names = c("종로구", "중구"),
        ylab = "FINEDUST_PM", col = c("blue", "green"))

t.test(data = dustdata_anal, finedust ~ area, var.equal = T)









