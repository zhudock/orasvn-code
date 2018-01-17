CREATE OR REPLACE FUNCTION "ORASVN"."GETCDDL" (
   i_name varchar2
  ,i_owner varchar2
  ,i_is_chicken_n_egg boolean := false
) return clob
is
  /*
    This file is part of OraSVN: https://sourceforge.net/projects/orasvn/

    OraSVN is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    OraSVN is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
  */

  l_src clob := chr(10);
  l_c_source csource%rowtype;
begin
  select * into l_c_source from csource where name = i_name and owner = i_owner;
  
  l_src :=  l_src || 'begin' || chr(10);
  l_src :=  l_src || 'orasvn.cc.createc('''|| i_name ||''', '''|| l_c_source.cc_switches ||''', q''[';
  l_src :=  l_src || l_c_source.code;
  l_src :=  l_src || ']'', ''' || i_owner || '''';
  l_src :=  l_src || ');' || chr(10);
  l_src :=  l_src || 'end;' || chr(10);
  l_src :=  l_src || '/' || chr(10);

  if i_is_chicken_n_egg then
    l_src :=  l_src || chr(10);
    l_src :=  l_src || 'set serveroutput on' || chr(10);
    l_src :=  l_src || 'set wrap off' || chr(10);
    l_src :=  l_src || 'set feedback off' || chr(10);
    l_src :=  l_src || 'set pagesize 0' || chr(10);
    l_src :=  l_src || 'set verify off' || chr(10);
    l_src :=  l_src || 'set trimspool on' || chr(10);
    l_src :=  l_src || 'set linesize 5000' || chr(10);
    l_src :=  l_src || 'set sqlprompt --SQL>' || chr(10);
    l_src :=  l_src || 'spool compile.c.sql' || chr(10);
    l_src :=  l_src || 'begin' || chr(10);
    l_src :=  l_src || '  dbms_output.put_line('|| chr(10);  
    l_src :=  l_src || '    ''HOST '' || orasvn.cc.get_make_cmd(''' || i_name || ''', ''' || l_c_source.cc_switches || ''', ''' || i_owner ||'''));' || chr(10);  
    l_src :=  l_src || 'end;' || chr(10);
    l_src :=  l_src || '/' || chr(10) || chr(10);
    l_src :=  l_src || 'spool off' || chr(10);
    l_src :=  l_src || '@compile.c.sql' || chr(10);
    l_src :=  l_src || 'exec orasvn.cc.make(''' || i_name || ''', ''' || l_c_source.cc_switches || ''', ''' || i_owner ||''', false);' || chr(10); 
  end if;
  
  return l_src;
end;
/
 
