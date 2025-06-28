IMPORT $;
IMPORT ML_Core;

myTrainData := $.Prepare.myTrainData;
myTestData  := $.Prepare.myTestData;

//Numeric Field Matrix conversion

ML_Core.ToField(myTrainData, myTrainDataNF);
ML_Core.ToField(myTestData, myTestDataNF);
// Output(myTrainDataNF);

EXPORT Convert := MODULE
//We have 7 independent fields and the last field (8) is the dependent
EXPORT myIndTrainDataNF := myTrainDataNF(number < 8); // Number is the field number
EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 8), 
                                   TRANSFORM(RECORDOF(LEFT), 
                                             SELF.number := 1,
                                             SELF := LEFT));

EXPORT myIndTestDataNF := myTestDataNF(number < 8); // Number is the field number
EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 8), 
                                  TRANSFORM(RECORDOF(LEFT), 
                                            SELF.number := 1,
                                            SELF := LEFT));
																									
END;
