CREATE OR REPLACE FUNCTION "ORASVN"."GETPATHSEPERATOR" return varchar2
is
  l_result varchar2(2000);
begin
  select bin into l_result from commands where cmd = 'path_seperator';
  return l_result;
end;
/
 
