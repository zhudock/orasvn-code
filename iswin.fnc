CREATE OR REPLACE FUNCTION "ORASVN"."ISWIN" return number 
is
  l_win varchar2(1000);
begin
  select platform_name into l_win from v$database;
  
  if lower(l_win) like '%win%' then return 1; else return 0; end if; 
end;
/
 
