

abolish <- read.csv("data_legal_slavery_country.csv", header=T, check.names=F, stringsAsFactors = F)

abolish_long <- abolish

#convert strings to years
illegal <- which(abolish=="Illegal", arr.ind=T)
legal <- which(abolish=="Legal", arr.ind=T)
abolish[illegal]<-colnames(abolish)[illegal[,2]]
#use the number 3000 to make sure it does not conflict in the row minimum calculation
abolish[legal]<-3000

abolish[4:221] <- as.numeric(unlist(abolish[4:221]))

#rowmin = year of abolition
abolish$abol <- apply(abolish[,4:221], 1, FUN=min)
abolish$cow_code <- countrycode(abolish$name, "country.name", "cown")
abolish$cow_code <- ifelse(abolish$name=="Serbia", 345, abolish$cow_code)

abolish <- completeFun(abolish, "cow_code")

abolish <- select(abolish, cow_code, abol)

wi_df <- left_join(wi_df, abolish, by = "cow_code")

# Saudi Arabia missing
wi_df <- wi_df %>%
  mutate(abol = ifelse(cow_code==670, 1962, abol))

# Almost all countries had slavery prior to capitalism. This is about chattel and profit-extraction/excess produciton slavery. Code slavery in a way that countries = 1 if they used slave/forced labor for industrial, colonial and capitalist production, or if they were a major source for the slaves used in this production (=1). Arabic peoples were major slave traders but were not major producers nor the source of slaves (so = 0)

#Long format
abolish_long[illegal] <- 0
abolish_long[legal] <- 1
abolish_long$cow_code <- countrycode(abolish_long$name, "country.name", "cown")
abolish_long$cow_code <- ifelse(abolish_long$name=="Serbia", 345, abolish_long$cow_code)
abolish_long <- abolish_long[,4:222]


abol_long <- reshape(abolish_long, direction = "long", idvar = "cow_code", v.names = "slavery", timevar = "year", times = 1800:2017, varying = list(names(abolish_long)[1:218]))

yes <- c(2,135,165,651,670,698,900)

no <- c(20,155,344,349,352,366,367,368,371,372,373,616,620,630,640,645,652,660,663,645,679,690,692,694,696,703,760,771,775,780,811,812,817,820,830,835,840,850,920, 200, 205, 210, 211, 212, 220, 221, 223, 225, 230, 235, 255, 290, 305, 310, 316, 317, 325, 338, 339, 345, 350, 355, 359, 360, 365, 369, 370, 375, 380, 385, 390, 395, 666, 698, 700, 701, 702, 704, 705, 710, 712, 731, 732, 740, 750, 770, 800, 817, 940, 950, 983, 986, 987)

wi_cnts <- abolish

wi_cnts <- wi_cnts %>%
  mutate(slavery = ifelse(is.na(abol),0,1),
         slavery = ifelse(cow_code %in% yes,1,slavery),
         slavery = ifelse(cow_code %in% no,0,slavery))
# Puerto Rico missing, code 1873
wi_cnts[nrow(wi_cnts)+1,] <- c(6,1873,1)

