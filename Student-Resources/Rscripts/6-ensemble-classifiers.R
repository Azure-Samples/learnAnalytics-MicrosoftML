ensemble <- rxEnsemble(
  formula = form,
  data = dataFile,
  type = "regression",
  trainers = list(fastTrees(), fastTrees(numTrees = 60), fastTrees(learningRate = 0.1)), #a list of trainers with their arguments.
  replace = TRUE # Indicates using a bootstrap sample for each trainer
)

mnist_ensemble <- rxEnsemble(
  formula = make_form(splits$train, resp_var = "BinLabel", vars_to_skip = c("splitVar", "Label")),
  data = splits$train, 
  type = "binary",
  transforms = list(BinLabel = ifelse(Label == 5, 1, 0)),
  trainers = list(fastTrees(), fastTrees(numTrees = 10)),
  replace = TRUE
)

rxPredict(mnist_ensemble,
          data = splits$test, 
          extraVarsToWrite = "Label",
          outData = RxXdfData(tempfile("scores.xdf")),
          overwrite = TRUE) -> mnist_ensemble_scores

mnist_ensemble_scores %>% 
  mutate(Class = ifelse(Label == 5,
                        1, 0)) -> scores


rxRocCurve(actualVarName = "Class",
           predVarNames = ("Probability.1"),
           data = scores)