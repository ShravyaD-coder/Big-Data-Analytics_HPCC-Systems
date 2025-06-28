IMPORT $;
output($.File_Water.File);
CleanFilter := $.File_Water.File(Ca >0 AND Mg>0 AND PH>0 AND TotalDissolvedSolid >0 AND TotalHardness>0 AND DO>0 AND BOD>0);

output(CleanFilter); 