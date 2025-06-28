IMPORT $;
Water:= $.File_Water.File;
DT_Water := $.File_Water.DTWater;

EXPORT Prepare := MODULE
DTPropExt := RECORD(DT_Water)
  UNSIGNED4 rnd; // A random number
END;
// Clean the data and assign a random number to each record
CleanFilter := Water.Ca>0 AND Water.Mg>0 AND Water.SecchiDepth>0 AND Water.SO4>0 AND Water.PH>0 AND 
               Water.TotalDissolvedSolid>0 AND Water.TotalHardness>0  ;
EXPORT myDataE := PROJECT(Water(CleanFilter), TRANSFORM(DTPropExt, 
                                                           SELF.rnd := RANDOM(),
                                                           
                                                           SELF := LEFT))
																							             :PERSIST('~DTTutorial::SD::PrepProp');
// Shuffle your data by sorting on the random field
SHARED myDataES := SORT(myDataE, rnd);
// Now cut the deck and you have random samples within each set
// While you're at it, project back to your original format -- we dont need the rnd field anymore
// Treat first 5000 as training data.  Transform back to the original format.
EXPORT myTrainData := PROJECT(myDataES[1..5000], DT_Water)
                              :PERSIST('~DTTutorial::SD::Train');  
// Treat next 2000 as test data
EXPORT myTestData  := PROJECT(myDataES[5001..7000], DT_Water)
                              :PERSIST('~DTTutorial::SD::Test'); 
END;
