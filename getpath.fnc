CREATE OR REPLACE FUNCTION "ORASVN"."GETPATH" (i_directory varchar2) return varchar2
is
  l_result varchar2(2000);
begin
  select directory_path into l_result from dba_directories 
    where upper(directory_name) = upper(i_directory);
    
  return l_result;
end;
/
 
