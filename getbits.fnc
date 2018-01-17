CREATE OR REPLACE FUNCTION "ORASVN"."GETBITS" return number 
is
  l_bit number;
begin
  select length(addr)*4 into l_bit 
    from
      v$process 
    where
      ROWNUM =1;
      
  return l_bit;
end;
/
 
