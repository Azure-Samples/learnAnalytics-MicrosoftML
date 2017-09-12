library(tidyverse)

# Data is downloaded from here:
# https://www.kaggle.com/c/digit-recognizer
kaggle_data <- read_csv("../data/train.csv")

pixels_gathered <- kaggle_data %>%
  mutate(instance = row_number()) %>%
  gather(pixel, value, -label, -instance) %>%
  tidyr::extract(pixel, "pixel", "(\\d+)", convert = TRUE)

roc_by_pixel <- pixels_gathered %>%
  filter(instance %% 20 == 0) %>%
  crossing(compare1 = 0:4, compare2 = 0:4) %>%
  filter(label == compare1 | label == compare2, compare1 != compare2) %>%
  group_by(compare1, compare2, pixel, value) %>%
  summarize(positive = sum(label == compare2),
            negative = n() - positive) %>%
  arrange(desc(value)) %>%
  mutate(tpr = cumsum(positive) / sum(positive),
         fpr = cumsum(negative) / sum(negative)) %>%
  filter(n() > 1)

roc_by_pixel %>%
  summarize(auc = sum(diff(fpr) * (tpr + lag(tpr))[-1]) / 2) %>%
  arrange(desc(auc)) %>%
  mutate(row = pixel %/% 28, column = pixel %% 28) %>%
  ggplot(aes(column, 28 - row, fill = auc)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = .5) +
  facet_grid(compare2 ~ compare1) +
  labs(title = "AUC for distinguishing pairs of MNIST digits by one pixel",
       subtitle = "Red means pixel is predictive of the row, blue predictive of the column",
       fill = "AUC") +
  theme_void()
