IMPORT ML_Core.Discretize;
IMPORT ML_Core;
IMPORT LearningTrees AS LT;
IMPORT $;

myDepTrainData := $.Convert.myDepTrainDataNF;
myDepTestData  := $.Convert.myDepTestDataNF;
myIndTrainData := $.Convert.myIndTrainDataNF;
myIndTestData  := $.Convert.myIndTestDataNF; 

myDepTrainDataDF := Discretize.ByRounding(myDepTrainData);
myDepTestDataDF  := Discretize.ByRounding(myDepTestData);

// OUTPUT(myDepTrainDataDF);
myLearnerC := LT.ClassificationForest();

myModelC := myLearnerC.GetModel(myIndTrainData, myDepTrainDataDF); 

// Notice second param uses the DiscreteField dataset
predictedClasses := myLearnerC.Classify(myModelC, myIndTestData);
assessmentC := ML_Core.Analysis.Classification.Accuracy(predictedClasses, myDepTestDataDF); 

// Both params are DF dataset
OUTPUT(assessmentC);
// To test new data
// predictedClasses := myLearnerC.Classify(myModelC, myNewIndData);
// NEW TASK: predict zip code values by other fields.

