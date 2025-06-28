IMPORT $;
Water := $.File_Water.File;

CleanFilter := Water(Ca >0 AND Mg>0 AND PH>0 AND TotalDissolvedSolid >0 AND TotalHardness>0 AND DO>0 AND BOD>0);

output(Water); 
//EXPORT Prep := CleanFilter;
output(Water(DateCollection[7..10]='1980'));
output(Water(DateCollection[7..10]='2021'));