library(MicrosoftML)
suppressPackageStartupMessages(library(dplyr))

# if you want to use a sample
# train_df <- train_df %>% sample_n(1000, replace = FALSE)

system.time(logit_model <- rxLogisticRegression(sentiment ~ reviewTran,
                                                data = train_xdf,
                                                l1Weight = 0.05,
                                                l2Weight = 0.05,
                                                mlTransforms = list(featurizeText(vars = c(reviewTran = "review"),
                                                                                  language = "English",
                                                                                  stopwordsRemover = stopwordsDefault(),
                                                                                  wordFeatureExtractor = ngramCount(3),
                                                                                  charFeatureExtractor = ngramCount(3),
                                                                                  keepNumbers = FALSE,
                                                                                  keepPunctuations = FALSE)))
)



system.time(fast_trees <- rxFastTrees(sentiment ~ reviewTran,
                                       data = train_xdf,
                                       mlTransforms = list(featurizeText(vars = c(reviewTran = "review"),
                                                                         language = "English",
                                                                         stopwordsRemover = stopwordsDefault(),
                                                                         wordFeatureExtractor = ngramCount(3),
                                                                         keepNumbers = FALSE,
                                                                         keepPunctuations = FALSE)))
)


# Summarize Coefficients from Elastic Net ---------------------------------

logit_cof <- coefficients(logit_model)
coefs <- data.frame(coef = logit_cof, word = names(logit_cof))
coefs <- tbl_df(coefs)

coefs <- coefs %>%
  filter(word != "(Bias)") %>% 
  mutate(abs_value = abs(coef), 
         sentiment = ifelse(coef > 0, "Positive", "Negative"), 
         score = round(abs_value, 0)) %>% 
  arrange(desc(abs_value)) %>% slice(1:100) 


library(ggplot2)
library(ggrepel)

coefs %>% 
  ggplot +
  aes(x = 1, y = 1, colour = sentiment, size = score, label = word) +
  geom_text_repel(segment.size = 0, force = 10) +
  scale_size(range = c(2, 15), guide = FALSE) +
  scale_y_continuous(breaks = NULL) +
  scale_x_continuous(breaks = NULL) +
  labs(x = '', y = '') +
  theme_classic() +
  facet_wrap(~sentiment)


# Plot Using d3wordcloud --------------------------------------------------

library(purrr)
library(d3wordcloud)

coefs %>% 
  split(.$sentiment) %>% 
  map( ~ d3wordcloud(.$word, .$score, tooltip = TRUE)) -> d3_graphs

d3_graphs[[1]]
d3_graphs[[2]]
