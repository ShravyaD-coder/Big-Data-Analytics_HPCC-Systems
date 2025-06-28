IMPORT $;
//output($.File_Water.File);
/*Water:=$.File_Water.File;
CleanFilter := $.File_Water.File(Ca >0 AND Mg>0 AND PH>0 AND TotalDissolvedSolid >0 AND TotalHardness>0 AND BOD>0);

row1 := CleanFilter(DateCollection[7..10]='2021'and BasinName='Cauvery Basin');
output(row1);

row2 := CleanFilter(DateCollection[7..10]='2021'and BasinName='Godavari Basin');
output(row2);

row3 := CleanFilter(DateCollection[7..10]='2021'and BasinName='Krishna Basin');
output(row3);

row4 := CleanFilter(DateCollection[7..10]='2021' and BasinName='West flowing rivers from Tapi to Tadri Basin');
output(row4);*/

IMPORT Visualizer;
            ds := DATASET([ {'Kaveri', 18, 10, 249, 86, 1.4},//done 
                            {'Godavari', 24.13, 15.05, 142.04, 124.83,1.56},//done
                            {'Tapi-Tadri', 5, 1, 26, 23.91,1.1},
                            {'Krishna', 23.85, 14.22, 195.74, 123.18,1.54}],//done
                            {STRING Basin, REAL4 Ca,REAL4 Mg, REAL4 TDS, REAL4 TH, REAL4 BOD});
                            //year,basin 1, basin 2, basin 3...
            data_exams := OUTPUT(ds, NAMED('MultiD__test'));

            //viz_area := Visualizer.MultiD.Area('area',, 'MultiD__test');
            //viz_bar := Visualizer.MultiD.Bar('bar',, 'MultiD__test');
            viz_column := Visualizer.MultiD.Column('column',, 'MultiD__test');
            //viz_line := Visualizer.MultiD.Line('line',, 'MultiD__test');
            //viz_radar := Visualizer.MultiD.Radar('radar',, 'MultiD__test');
            //viz_scatter := Visualizer.MultiD.Scatter('scatter',, 'MultiD__test');
            //viz_step := Visualizer.MultiD.Step('step',, 'MultiD__test');
            
            data_exams;
            //viz_area;
            //viz_bar;
            viz_column;
            //viz_line;
            //viz_radar;
            //viz_scatter;
            //viz_step;
        
    