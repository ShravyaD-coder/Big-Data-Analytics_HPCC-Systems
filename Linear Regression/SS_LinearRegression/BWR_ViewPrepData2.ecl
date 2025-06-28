IMPORT $;
OUTPUT($.Prep01.myDataE,NAMED('CleanProperty'));
COUNT($.Prep01.myDataE);
OUTPUT($.Prep01.myTrainData,NAMED('TrainData'));
COUNT($.Prep01.myTrainData);
OUTPUT($.Prep01.myTestData,NAMED('TestData'));
COUNT($.Prep01.myTestData);
// OUTPUT($.File_Property.File,,'~Property::BMF::Test',OVERWRITE);

IMPORT $;
IMPORT ML_Core;
myTrainData := $.Prep01.myTrainData;
myTestData  := $.Prep01.myTestData;
ML_Core.AppendSeqId(myTrainData, id,myTrainIDData);
OUTPUT(myTrainIDData);
ML_Core.ToField(myTrainIDData, myTrainDataNF);
OUTPUT(myTrainDataNF);

