--"s_access_control"."NEXTVAL"

--"sz_access_control".NEXTVAL


alter table "access_control" modify ("acId" DEFAULT ON NULL "s_access_control".NEXTVAL);

CREATE SEQUENCE "s_tablename" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;


CREATE SEQUENCE "sz_logtablename" START WITH 1 INCREMENT BY 1 CACHE 20 NOCYCLE MINVALUE 1 NOMAXVALUE;