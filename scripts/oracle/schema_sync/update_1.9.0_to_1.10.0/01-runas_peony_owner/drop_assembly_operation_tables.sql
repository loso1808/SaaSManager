

drop table "assembly_op_input" cascade constraints purge;
drop table "assembly_op_output" cascade constraints purge;
drop table "assembly_operation" cascade constraints purge;
drop table "assembly_run" cascade constraints purge;


drop table "z_assembly_op_input" cascade constraints purge;
drop table "z_assembly_op_output" cascade constraints purge;
drop table "z_assembly_operation" cascade constraints purge;
drop table "z_assembly_run" cascade constraints purge;


drop sequence "s_assembly_op_input";
drop sequence "s_assembly_op_output";
drop sequence "s_assembly_operation";
drop sequence "s_assembly_run";


drop sequence "sz_assembly_op_input";
drop sequence "sz_assembly_op_output";
drop sequence "sz_assembly_operation";
drop sequence "sz_assembly_run";