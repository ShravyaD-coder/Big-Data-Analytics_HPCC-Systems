IMPORT $;
IMPORT ML_Core;

myTrainData := $.Prep01.myTrainData;
myTestData  := $.Prep01.myTestData;

ML_Core.AppendSeqId(myTrainData, id,myTrainIDData);//Add a sequential ID - CRITICAL to this bundle
ML_Core.AppendSeqId(myTestData, id, myTestIDData);

//Numeric Field Matrix conversion
ML_Core.ToField(myTrainIDData, myTrainDataNF);
ML_Core.ToField(myTestIDData, myTestDataNF);

// Output(myTrainDataNF);
EXPORT Convert02 := MODULE
   //We have 9 independent fields and the last field (10) is the dependent
   EXPORT myIndTrainDataNF := myTrainDataNF(number < 6); // Number is the field number
   EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 6), 
                                      TRANSFORM(RECORDOF(LEFT), 
                                                SELF.number := 1,
                                                SELF := LEFT));
   EXPORT myIndTestDataNF := myTestDataNF(number < 6); // Number is the field number
   EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 6), 
                                     TRANSFORM(RECORDOF(LEFT), 
                                               SELF.number := 1,
                                               SELF := LEFT));
   																									
END;

