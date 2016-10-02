select uc.TABLE_NAME, ucc.COLUMN_NAME, utc.DATA_TYPE
        from 
          user_constraints uc
            inner join 
          user_cons_columns ucc
            on uc.constraint_name = ucc.constraint_name
            inner join
          user_tab_cols utc
            on utc.TABLE_NAME = uc.TABLE_NAME
            and utc.COLUMN_NAME = ucc.COLUMN_NAME
        where uc.constraint_type = 'P' 
        and ucc.constraint_name not like 'BIN$%'
        and utc.DATA_TYPE <> 'NUMBER';