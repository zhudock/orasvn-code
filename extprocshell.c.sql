begin
orasvn.cc.createc('extprocshell', '-fPIC -shared', q'[
int extprocshell(char *cmd)
{
  return system(cmd);
}
]', 'ORASVN');
end;
/

set serveroutput on
set wrap off
set feedback off
set pagesize 0
set verify off
set trimspool on
set linesize 5000
set sqlprompt --SQL>
spool compile.c.sql
begin
  dbms_output.put_line(
    'HOST ' || orasvn.cc.get_make_cmd('extprocshell', '-fPIC -shared', 'ORASVN'));
end;
/

spool off
@compile.c.sql
exec orasvn.cc.make('extprocshell', '-fPIC -shared', 'ORASVN', false);

