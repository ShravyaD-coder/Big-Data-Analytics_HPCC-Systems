IMPORT ML_Core;
IMPORT ML_Core.Types as Types;
IMPORT LinearRegression AS LR;
IMPORT $;

/**
  * Train Linear Regression model on Property data
  */

// Read enhanced data
IndTrain := $.Convert02.myIndTrainDataNF;
DepTrain := $.Convert02.myDepTrainDataNF;
IndTest  := $.Convert02.myIndTestDataNF;
DepTest  := $.Convert02.myDepTestDataNF;
OUTPUT(IndTrain,NAMED('ITrain'));
OUTPUT(DepTrain,NAMED('DTrain'));
OUTPUT(IndTest,NAMED('ITest'));
OUTPUT(DepTest,NAMED('DTest'));

Train := LR.OLS(IndTrain,DepTrain);
MyModel := Train.GetModel;

Betas   := Train.Betas();
OUTPUT(Betas,NAMED('Betas'));

MyPredict := Train.Predict(IndTest,MyModel);
OUTPUT(MyPredict,NAMED('Prediction'));

// comparing original dep value to predicted value
test_rslt := RECORD
  REAL TestY;
  REAL PredictY;
  REAL diff;
 END;

NumericField := Types.NumericField;
test_rslt formatRslt1(NumericField Le, NumericField Ri) := TRANSFORM
  SELF.TestY    := Le.value;
  SELF.PredictY := Ri.value;
  SELF.diff     := SELF.TestY - SELF.PredictY;
 END;
rslt1 := JOIN(DepTest, MyPredict, LEFT.id=RIGHT.id, formatRslt1(LEFT, RIGHT));
OUTPUT(rslt1,NAMED('depAcc'));

//More ANALYSIS
//R Squared - R Squared generally varies between 0 and 1, 
//with 1 indicating an exact linear fit, and 0 indicating that a
//linear fit will have no predictive power
Rsq := Train.RSquared;
OUTPUT(Rsq,NAMED('RSq'));
ARsq := Train.AdjRSquared;
OUTPUT(ARsq,NAMED('AdjRSq'));

//ANOVA
an := Train.Anova;
OUTPUT(an,NAMED('Anova'));

//SE - Standard Error
SEVal := Train.SE;
OUTPUT(SEVal,NAMED('SE'));

//TStat
TVal := Train.TStat;
OUTPUT(TVal,NAMED('TStat'));

//AIC - Akaike Information Criterion
AICVal := Train.AIC;
OUTPUT(AICVal,NAMED('AIC'));

//pval - probablility
pValue := Train.pval;
OUTPUT(pValue,NAMED('pval'));

//ConfInt - confidence interval
CIVal := Train.ConfInt(95);
OUTPUT(CIVal,NAMED('ConfInt'));

//FTest
FVal := Train.FTest;
OUTPUT(FVal,NAMED('FVal'));