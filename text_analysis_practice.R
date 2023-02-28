# R script following text analysis tutorial


install.packages('tidytext')
install.packages('pdftools')
install.packages('tm')
install.packages('wordcloud2')

# load these 
library(tidyverse)
library(rvest)
library(tidytext)
library(pdftools) #Text Extraction, Rendering and Converting of PDF Documents
library(tm)
library(broom)
library(wordcloud2)
library(devtools)


# this is the url that I first pulled from
https://www.nytimes.com/2023/02/21/us/politics/barbara-lee-senate-california.html

paragraphs <- read_html("https://www.nytimes.com/2023/02/21/us/politics/barbara-lee-senate-california.html") %>%
  html_elements( ".css-at9mc1") %>%
  html_text()

# this creates a function 'scraper'
scraper <- function(url, elements) {
  read_html(url) %>% #This reads the html of the url provided
    html_elements(elements) %>% #This selects the specific node you're looking to scrape
    html_text() %>% #This then scrapes the text from that note
    enframe("id", "text") #This puts it into a data frame with one column being id (or th
}


# this is using the 'scraper' function to scrape text from an article in the NYT
# This places all the elements into a dataframe, with each individual element placed in rows 
article2 <- scraper(
  url = "https://www.nytimes.com/2023/02/21/us/homelessness-us-california.html",
  elements = ".css-at9mc1")

# I don't need any of the rows below row 12
# this simply empties out all the rows identified, replacing them with 'NA'
article2[13:26,] <- NA

# this function from the dplyr package 'dplyr::drop_na' 
# drops rows where any column specified by ... contains a missing value
article2 <- article2 %>% 
  drop_na()


######--------------------------------------------------------------------------


anthems <- rio::import('data/anthems.csv') %>% 
  janitor::clean_names()


View(anthems)

tidy_anthems <- anthems %>% unnest_tokens(word, anthem)

View(stop_words)

anthems_sansstop <- tidy_anthems %>% 
  anti_join(stop_words)


anthems_sansstop %>% count(word, sort = TRUE) %>% View()

anthems_sansstop %>% count(word, sort = TRUE) %>% head(n = 10) %>% 
  ggplot(aes(x = word, y = n))+
  geom_col()

unique(anthems$continent)










