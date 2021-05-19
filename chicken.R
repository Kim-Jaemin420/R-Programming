library("readxl")
ck <- read_excel("치킨집_가공.xlsx")

# head = 자료 일부 보기
head(ck)

# 전체 주소에서 xxx동만 나오도록 잘라내기
addr <- substr(ck$소재지전체주소, 11, 14)
head(addr)

# gsub = 찾아서 바꾸기
addr_trim <- gsub(" ", "", addr)
head(addr_trim)

# dplyr = 데이터 전처리를 위한 패키지
library(dplyr)

addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count)

library("treemap")



par(family="AppleGothic")

treemap(addr_count, index = ".", vSize = "Freq", title = "종로구 동별 치킨집 분표", fontfamily.labels="AppleGothic")
