EXPORT File_Water := MODULE

EXPORT Layout := RECORD
    STRING15 BlockName;
    STRING50 BasinName;
    UNSIGNED3 BasinID;
    STRING20 DateCollection;
    REAL8 Ca;
    REAL8 PH;
    REAL8 Temperature;
    REAL8 TotalDissolvedSolid;
    REAL8 TotalHardness;
    REAL8 DO;
    REAL8 BOD;
    REAL8 Mg;
END;
EXPORT File := DATASET('~CLASS::SD::Intro::WaterVisu',Layout, CSV);
END;
//Cauvery : 1-3784
//Godavari : 3785- 4050
//Krishna : 4051-9068
//Pennar : 9069-9081
//West flowing rivers from Tadri to Kanyakumari Basin : 9082-10050
//West flowing rivers from Tapi to Tadri Basin :10051-10269