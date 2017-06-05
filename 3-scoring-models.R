
# Score the elastic net ---------------------------------------------------

predictions <- rxPredict(logit_model, data = test_df, extraVarsToWrite = "sentiment")
roc_results <- rxRoc(actualVarName = "sentiment", predVarNames = "Probability.1", data = predictions)
roc_results$predVarName <- factor(roc_results$predVarName)
plot(roc_results)


# Score the Fast Trees ----------------------------------------------------

predictions <- rxPredict(fast_linear, data = test_df, extraVarsToWrite = "sentiment")
roc_results <- rxRoc(actualVarName = "sentiment", predVarNames = "Probability.1", data = predictions)
roc_results$predVarName <- factor(roc_results$predVarName)
plot(roc_results)


