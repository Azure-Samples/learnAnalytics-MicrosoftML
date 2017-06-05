nn_sentiment <- rxNeuralNet(sentiment ~ reviewTran,
                            data = train_df,
                            type = "binary",
                            mlTransforms = list(featurizeText(vars = c(reviewTran = "review"),
                                                              language = "English",
                                                              stopwordsRemover = stopwordsDefault(),
                                                              keepNumbers = FALSE,
                                                              keepPunctuations = FALSE)),
                            # acceleration = "gpu",
                            miniBatchSize = 4)


# scoring the nnet --------------------------------------------------------

predictions <- rxPredict(nn_sentiment, data = test_df, extraVarsToWrite = "sentiment")
roc_results <- rxRoc(actualVarName = "sentiment", predVarNames = "Probability.1", data = predictions)
roc_results$predVarName <- factor(roc_results$predVarName)
plot(roc_results)
