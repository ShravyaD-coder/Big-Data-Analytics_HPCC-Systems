IMPORT $;

/*Water:=$.File_Water.File;
CleanFilter := $.File_Water.File(Ca >0 AND Mg>0 AND PH>0 AND TotalDissolvedSolid >0 AND TotalHardness>0 AND BOD>0);
//output(CleanFilter);
//count(cleanfilter);

row1 := CleanFilter(DateCollection='01-01-1980 00:00',BlockName='SOMVARPET',BasinName='Cauvery Basin');
//output(row1);

row2 := CleanFilter(DateCollection[7..10]='1980' and BasinName='Godavari Basin');
//output(row2);

row3 := CleanFilter(DateCollection='01-01-1980 00:00',BlockName='SHIMOGA',BasinName='Krishna Basin');
//output(row3);

row4 := Water(DateCollection[7..10]='1979' and BasinName='West flowing rivers from Tapi to Tadri Basin');
//output(row4);*/

IMPORT Visualizer;
            ds := DATASET([ {'Kaveri', 12.2, 5, 48, 51.3, 0.44},
                            {'Godavari', 23.41, 14.53, 277.44, 120.69,1.52},
                            {'Tapi-Tadri', 14.60, 9.58, 40, 75.82,0.78},
                            {'Krishna', 23.41, 14.53, 277.43, 120.69,1.52}],
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
        
    