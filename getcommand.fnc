CREATE OR REPLACE FUNCTION "ORASVN"."GETCOMMAND" (i_cmd varchar2) return varchar2
is
  l_result varchar2(2000);
begin
  select bin into l_result from commands where cmd = i_cmd;
  return l_result;
end;
/
 
