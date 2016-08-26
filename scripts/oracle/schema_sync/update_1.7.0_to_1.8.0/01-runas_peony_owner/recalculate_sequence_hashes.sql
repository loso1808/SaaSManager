
--run the following statement as schema owner to test if you can execute dbms_crypto
--select dbms_crypto.hash(utl_raw.cast_to_raw('ATGC'), 4) test_hash, '9820F5A84CC404330E6D97BDE13B580FE9BF68B9CA0974624593F6324553088C' expected_hash from dual;

--run following statement as sys to grant execute to schema owner
--grant execute on dbms_crypto to PEONY_OWNER;

--used to test on new hash value to make sure it works
--select "hash", lower(dbms_crypto.hash(upper("sequence"), 4)) seqhash from "sequence" where rownum < 100 and "sequence" is not null; 

update "sequence"
set "hash" = lower(dbms_crypto.hash(upper("sequence"), 4))
where "sequence" is not null;
