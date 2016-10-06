

alter table "devicedesign" add ( "assemblyMethod" varchar2(256), 
                                 "paramPreset" varchar2(256));
                                 
alter table "z_devicedesign" add ( "assemblyMethod" varchar2(256), 
                                  "paramPreset" varchar2(256));
                                  

alter table "j5run" add ( "warnings" clob, 
                          "error" clob);
                          
alter table "z_j5run" add ( "warnings" clob, 
                          "error" clob);
                          
                          
alter table "sequence" add ("j5run_id" NUMBER);


alter table "z_sequence" add ("j5run_id" NUMBER);