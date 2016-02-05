create or replace FUNCTION CONCAT_CLOB_BUFFER 
(
  BUFFER_ID IN VARCHAR2 
) RETURN CLOB
IS
  accumulator CLOB;
  counter NUMBER := 0;
BEGIN
  FOR x IN 
    (SELECT "chunk" 
     FROM "clob_buffer"
     WHERE "bufferId" = BUFFER_ID
     ORDER BY "chunkIndex")
  LOOP
    accumulator := accumulator || x."chunk";  
  END LOOP;
  
  RETURN accumulator;
END CONCAT_CLOB_BUFFER;
/