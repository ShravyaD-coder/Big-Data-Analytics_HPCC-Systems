EXPORT File_Water := MODULE

EXPORT Layout := RECORD
    UNSIGNED4 Row_no;
    STRING20 DateCollection;
    UNSIGNED1 basin_id;
    UNSIGNED2 Ca;
    UNSIGNED2 Mg;
    UNSIGNED3 SecchiDepth;
    UNSIGNED3 SO4;
    UNSIGNED2 PH;
    UNSIGNED3 TotalDissolvedSolid;
    UNSIGNED4 TotalHardness;
    UNSIGNED1 Potability;
END;
EXPORT File := DATASET('~CLASS::Intro::SD::Potability',Layout, CSV);

EXPORT DTWater := RECORD
    UNSIGNED4 Row_no;
    UNSIGNED2 Ca;
    UNSIGNED2 Mg;
    UNSIGNED3 SecchiDepth;
    UNSIGNED3 SO4;
    UNSIGNED2 PH;
    UNSIGNED3 TotalDissolvedSolid;
    UNSIGNED4 TotalHardness;
    UNSIGNED1 Potability;  // dependent variable  
END;
EXPORT DTWaterDS :=DATASET('~CLASS::Intro::SD::FullWaterDT',DTWater,THOR);
END;
//Cauvery : 1-3784
//Godavari : 3785- 4050
//Krishna : 4051-9068
//Pennar : 9069-9081
//West flowing rivers from Tadri to Kanyakumari Basin : 9082-10050
//West flowing rivers from Tapi to Tadri Basin :10051-10269
