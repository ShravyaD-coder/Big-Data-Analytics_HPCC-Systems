EXPORT File_Water := MODULE

EXPORT Layout := RECORD
    STRING15 StationName;
    STRING15 DistrictName;
    STRING25 BlockName;
    STRING50 BasinName;
    STRING30 SubBasinName;
    UNSIGNED3 BasinID;
    STRING20 DateCollection;
    REAL8 PH;
    REAL8 Temperature;
    REAL8 TotalDissolvedSolid;
    REAL8 TotalHardness;
    REAL8 DO;
    REAL8 BOD;   
END;
//EXPORT File := DATASET('~CLASS::SD::Intro::Water1.1',Layout, CSV);
EXPORT File := DATASET('~CLASS::SD::Intro::Water1',Layout, CSV);
EXPORT MLWater := RECORD
    //REAL8 BasinID;
    REAL8 PH;
    REAL8  Temperature;
    REAL8  TotalDissolvedSolid;
    REAL8  TotalHardness;
    REAL8  DO;
    REAL8  BOD; //Dependent variable  
END;
EXPORT MLWaterDS :=DATASET('~CLASS::SD::Intro::FullWaterML',MLWater,THOR);
END;
//Cauvery : 1-3784
//Godavari : 3785- 4050
//Krishna : 4051-9068
//Pennar : 9069-9081
//West flowing rivers from Tadri to Kanyakumari Basin : 9082-10050
//West flowing rivers from Tapi to Tadri Basin :10051-10269