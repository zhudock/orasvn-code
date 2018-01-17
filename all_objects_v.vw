CREATE OR REPLACE FORCE VIEW "ORASVN"."ALL_OBJECTS_V" ("OWNER", "OBJECT_NAME", "OBJECT_TYPE") AS 
  select owner, object_name, replace(decode(object_type, 'PACKAGE', 
'PACKAGE_SPEC', object_type), ' ', '_') object_type 
  from dba_objects where generated = 'N'
union all
select owner, constraint_name, decode(constraint_type,'R', 
'REF_CONSTRAINT', 'CONSTRAINT')
  from dba_constraints;
 
