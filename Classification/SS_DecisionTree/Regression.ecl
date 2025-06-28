IMPORT LearningTrees AS LT;
IMPORT ML_Core;
IMPORT $;

// RegressionForest(UNSIGNED numTrees=100, UNSIGNED featuresPerNode=0, UNSIGNED maxDepth=100, SET OF UNSIGNED nominalFields=[])
// We use the default configuration parameters.  That usually works fine.
myLearnerR    := LT.RegressionForest(); 
myModelR      := myLearnerR.GetModel($.Convert.myIndTrainDataNF, $.Convert.myDepTrainDataNF);

predictedDeps := myLearnerR.Predict(myModelR, $.Convert.myIndTestDataNF);
OUTPUT(predictedDeps);//workitem,uniqueid,field number, dependent value

assessmentR   := ML_Core.Analysis.Regression.Accuracy(predictedDeps, $.Convert.myDepTestDataNF);
OUTPUT(assessmentR);

// To test new data:
// predictedValues := myLearnerR.Predict(myModelR, myNewIndData);
//improve the testing
myLearnerR2    := LT.RegressionForest(,,,[0]); // Make the basin id field a nominal (categorical) field.
myModelR2      := myLearnerR2.GetModel($.Convert.myIndTrainDataNF, $.Convert.myDepTrainDataNF);

predictedDeps2 := myLearnerR2.Predict(myModelR2, $.Convert.myIndTestDataNF);
OUTPUT(predictedDeps2);//workitem,uniqueid,field number, dependent value

assessmentR2   := ML_Core.Analysis.Regression.Accuracy(predictedDeps2, $.Convert.myDepTestDataNF);
OUTPUT(assessmentR2);
