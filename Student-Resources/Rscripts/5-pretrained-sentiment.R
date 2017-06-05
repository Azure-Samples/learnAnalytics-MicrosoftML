library(tidyr)

sentimentScores <- rxFeaturize(data = test_df,
                               mlTransforms = getSentiment(vars = list(SentimentScore = "review")))


sentimentPredictions <- tbl_df(sentimentScores) %>% 
  mutate(pred = ifelse(SentimentScore > 0.5,
                       "pos", "neg")) %>% 
  bind_cols(select(test_df, sentiment))

sentimentPredictions %>% group_by(sentiment, pred) %>% tally

roc_results <- rxRoc(actualVarName = "sentiment", predVarNames = "SentimentScore", data = sentimentPredictions)
roc_results$predVarName <- factor(roc_results$predVarName)
plot(roc_results)
