library(RSQLite)
library(dplyr)

sqlite_file1 <- "C:/Users/Nicolas/made-template/data/political_opinion.sqlite"
sqlite_file2 <- "C:/Users/Nicolas/made-template/data/weather_event_damages.sqlite"

conn1 <- dbConnect(SQLite(), sqlite_file1)
conn2 <- dbConnect(SQLite(), sqlite_file2)

political_opinion <- tbl(conn1, "political_opinion") %>% collect()
weather_event_damages <- tbl(conn2, "weather_event_damages")

grouped_table <- weather_event_damages %>%
  group_by(STATE) %>%
  summarize(summarized_value = sum(TOTAL_CASUALITIES, na.rm = TRUE)) %>%
  collect()

joined_table <- grouped_table %>%
  inner_join(political_opinion, by = c("STATE" = "GeoName"))
joined_data <- collect(joined_table)

correlation_result <- cor(joined_data$AverageOpinionTrend, joined_data$summarized_value, use = "complete.obs")

print(paste("The correlation between var1 and var2 is:", correlation_result))

dbDisconnect(conn1)
dbDisconnect(conn2)
