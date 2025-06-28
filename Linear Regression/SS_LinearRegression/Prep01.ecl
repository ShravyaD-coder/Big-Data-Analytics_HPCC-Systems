IMPORT $;
Water:= $.File_Water.File;
ML_Water := $.File_Water.MLWater;

EXPORT Prep01 := MODULE
MLPropExt := RECORD(ML_Water)
  UNSIGNED4 rnd; // A random number
END;
// Clean the data and assign a random number to each record
CleanFilter := Water.DateCollection <> '' AND Water.PH > 0 AND Water.Temperature > 0 AND 
               Water.TotalDissolvedSolid > 0 AND 
               Water.TotalHardness > 0 AND Water.DO > 0 AND 
               Water.BOD > 0;
EXPORT myDataE := PROJECT(Water(CleanFilter), TRANSFORM(MLPropExt, 
                                                           SELF.rnd := RANDOM(),
                                                           SELF := LEFT))
																							             :PERSIST('~MLTutorial::BMF::PrepProp');
// Shuffle your data by sorting on the random field
SHARED myDataES := SORT(myDataE, rnd);
// Now cut the deck and you have random samples within each set
// While you're at it, project back to your original format -- we dont need the rnd field anymore
// Treat first 5000 as training data.  Transform back to the original format.
EXPORT myTrainData := PROJECT(myDataES[1..5000], ML_Water)
                              :PERSIST('~LRTutorial::SD::Train');  
// Treat next 2000 as test data
EXPORT myTestData  := PROJECT(myDataES[5001..], ML_Water)
                              :PERSIST('~LRTutorial::SD::Test'); 
END;
