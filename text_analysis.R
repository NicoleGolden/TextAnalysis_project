

# load source 
source("config.R")

# load data
chat <- read.csv("data/chat_counts.csv")

#  I define the variable "total_count" as the total word counts related to economics for each student. Table 1 gives a summary statistics.

### Table 1: Summary Statistics for "total_count"
# Summary of character counts
pander(summary(chat$total_count), 
       style='rmarkdown' ) 

### Figure 1: Histogram for "total_count"
# histogram
hist(chat$total_count, 
     main = "",
     xlab = "Word total counts",
     ylab = "Frequency")


# load text
text <- read.table("data/text1.txt",
                   sep =",",
                   header = F)

text <- paste(text, collapse = " ")

# Remove slashes
text <- str_replace_all(text, pattern = '\"', replacement = "") 

# Remove \n
text <- str_replace_all(text, pattern = '\n', replacement = "") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0092', replacement = "'") 

#Replace with quote
text <- str_replace_all(text, pattern = '\u0091', replacement = "'") 


# make it to tibble data format (neater data frame)
text_df <- data_frame(Text = text) 


text_words <- text_df %>% 
  unnest_tokens(output = word, input = Text) 


# load stop words 
data(stop_words)


# Remove stop words in peter_words
text_words  <- 
  text_words  %>%
  anti_join(stop_words) 


text_wordcounts <- 
  text_words  %>% 
  count(word, sort = TRUE)

### Table 2: Top 10 Most Frequently Used Words in Class

pander(head(text_wordcounts,10), 
       style='rmarkdown' ) 


text_wordcounts <- text_wordcounts %>% 
  filter(n >1) %>% 
  mutate(word = reorder(word,n))


text_wordcounts30 <- text_wordcounts[1:30, ]

# check words
text_wordcounts30

### Figure 2: Top Most Frequently Used Words in Class

ggplot(data = text_wordcounts30, aes(word, n)) + 
  geom_col(fill="darkred") +
  coord_flip() + 
  labs(x = "Keyword \n", y = "Count") +
  theme(plot.title = element_text(hjust=0.5),
        axis.title.x = element_text(face="bold", colour="darkblue", size=12),
        axis.title.y = element_text(face="bold", colour="darkblue", size=12),
        plot.margin = margin(0.3,.1,0.3,.1, "cm")) + theme

# load text 2
text <- read.table("data/text2.txt",
                   sep =",",
                   header = F)

text <- c("technology, income inequality, Sustainability, Growth, resources allocation, Citizen LivingStandard, Income, Poverty, Poverty, SocialWelfare, Covid19 pandemic,  inequality, Raw material supply, unemployment, inflation, inequality between global north and global south, Money growth, Healthy development, Inflation, SocialWelfare, Wealth gap, Wealth gap, Income inequality, EconomicGrowth, Sustainability, Poverty, inflation rate, LivingStandard, Government policy about housing problems and wealth unbalance, Unemployment, SocialWelfare, EconomicGrowth, nutrition, health, SocialWelfare, inflation, Tax and law, EconomicGrowth, Market efficiency, unemployment, Health problem, inflation, Sustainability, growth, inflation, efficiency, allocation, resources distribution, Climate change, Global income inequality, Hunger, inflation, equality, resources, inflation, Scarcity, inflation, wealth gap, policy change, Environmental economics, economics stability, Tax Policy, Demand and supply, natural disaster impacts, energy sustainability, sustainability, environmental economy, climate, environmental, economist field, Depression, Growth and development, inflation, Covid19, SocialWelfare, Inflation, inflation, tax and inflation, production, resources distribution, Economic Development, Economic Growth, Economic Development, Inflation")

text <- paste(text, collapse = " ")
text <- str_replace_all(text, pattern = '\"', replacement = "") # Remove slashes
text <- str_replace_all(text, pattern = '\n', replacement = "") # Remove \n
text <- str_replace_all(text, pattern = '\u0092', replacement = "'") #Replace with quote
text <- str_replace_all(text, pattern = '\u0091', replacement = "'") #Replace with quote


text_df <- data_frame(Text = text) # tibble aka neater data frame

text_words <- text_df %>% 
  unnest_tokens(output = word, input = Text) 

data(stop_words)

text_words  <- text_words  %>%
  anti_join(stop_words) # Remove stop words in peter_words

text_wordcounts <- 
  text_words  %>% 
  count(word, sort = TRUE)

dim(text_wordcounts)

### Table 3: What Topics Do Economists Care About?
pander( head(text_wordcounts,10), 
        style='rmarkdown' ) 

text_wordcounts <- text_wordcounts %>% 
  filter(n >1) %>% 
  mutate(word = reorder(word,n))

# check words 
text_wordcounts

### Figure 3: What Topics Do Economists Care About?

ggplot(data = text_wordcounts, aes(word, n)) + 
  geom_col(fill="darkred") +
  coord_flip() + 
  labs(x = "Keyword\n", y = "Count") +
  theme(plot.title = element_text(hjust=0.5),
        axis.title.x = element_text(face="bold", colour="darkblue", size=12),
        axis.title.y = element_text(face="bold", colour="darkblue", size=12),
        plot.margin = margin(0.3,.1,0.3,.1, "cm")) + theme

### Figure 4: Word Cloud - What Topics Do Economists Care About?

# insert image
# ![](figure/wordcloud_large.png)


