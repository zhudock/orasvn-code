CREATE OR REPLACE FORCE VIEW "ORASVN"."SRC_SEQ_V" ("PROJECT_NAME", "OWNER", "NAME", "TYPE", "SEQ") AS 
  SELECT DISTINCT project_name, owner, NAME, TYPE,
            DECODE (TYPE,
                    'USER', 1,
                    'LIBRARY', 2,
                    'TYPE', 3,
                    'TYPE_SPEC', 3,
                    'TABLE', 4,
                    'TABLE_DATA', 5,
                    'PACKAGE', 6,
                    'PACKAGE_SPEC', 6,
                    'VIEW', 7,
                    'CONSTRAINT', 8,
                    'INDEX', 9,
                    'REF_CONSTRAINT', 10,
                    'TRIGGER', 11,
                    'PROCEDURE', 12,
                    'FUNCTION', 13,
                    'TYPE_BODY', 14,
                    'TYPE BODY', 14,
                    'PACKAGE_BODY', 15,
                    'PACKAGE BODY', 15
                                      --dbms_utility.compile_schema
            ,
                    'USER_GRANTS', 16,
                    'C', 17,
                    'SYNONYM', 18,
                    99
                   ) seq
       FROM sources
   ORDER BY seq ;
 
