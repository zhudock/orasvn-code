CREATE OR REPLACE PACKAGE BODY "ORASVN"."CC" is
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

  function get_c_lib_name(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared' 
  ) return varchar2
  is
    l_dir    varchar2(4000) := 
      rtrim(getPath('ORACLE_LIB'), getPathSeperator) || getPathSeperator;
    l_ext    varchar2(3);
  begin
    if isWin>0 then 
      l_ext := '.dll'; 
    else
      if i_cc_switches like '%shared%' then 
        l_ext := '.so';
      else
        l_ext := '.o';
      end if; 
    end if;
    
    return l_dir || i_name || l_ext;
  end get_c_lib_name;
  
  function get_make_cmd(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared' 
   ,i_owner varchar2 := user
  ) return varchar2
  is
    l_cc_cmd varchar2(4000);
    l_dir    varchar2(4000) := 
      rtrim(getPath('ORACLE_LIB'), getPathSeperator) || getPathSeperator;
    l_code   clob;
    l_c_lib  varchar2(4000);
  begin
    select bin || ' ' || args into l_cc_cmd from commands where cmd = 'cc';
    
    
    l_c_lib := get_c_lib_name(i_name, i_cc_switches);
    
    l_cc_cmd := l_cc_cmd || ' -m' || getBits || ' ' || i_cc_switches || 
      ' -I' || l_dir || 
      ' -I' || getPath('OCI_H') ||
      ' -o ' || l_c_lib || ' ' || l_dir || i_name || '.c';
      
    return l_cc_cmd;
  end get_make_cmd;
  
  procedure make(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared' 
   ,i_owner varchar2 := user
   ,i_do_not_compile boolean := false
  ) 
  is
    l_cc_cmd varchar2(4000);
    l_result clob;
    l_err    varchar2(4000);
    l_c_lib  varchar2(4000);
    l_dir    varchar2(4000) := 
      rtrim(getPath('ORACLE_LIB'), getPathSeperator) || getPathSeperator;
    l_code   clob;
  begin 
    select code into l_code from csource where name = i_name and owner = i_owner;
    
    SVN_FILE.UTL_FILE_WRITE('ORACLE_LIB',i_name || '.c', l_code);
    l_cc_cmd := get_make_cmd(i_name,i_cc_switches,i_owner);
    l_c_lib := get_c_lib_name(i_name, i_cc_switches);
    
    if not i_do_not_compile then 
      begin
        execute immediate 
          'begin :l_result := CMD.GETEXECCMD(:l_cc_cmd); end;' 
            using out l_result, in l_cc_cmd;
      
        update csource set bin_loaded = 1
          where name = i_name and owner = i_owner;
          
        exception when others then
          l_err := sqlerrm;
          update csource set bin_loaded = 0, compile_err = l_err
            where name = i_name and owner = i_owner;  
      end; 
    end if;
      
    commit;
    
    -- create library
    execute immediate 
      'CREATE OR REPLACE LIBRARY ' || i_owner || '.' || upper(i_name) || '_LIB ' ||
      'IS ''' || l_c_lib || '''';
    
    if l_err is not null then raise_application_error(-20001, l_err); end if;
  end;
  
  procedure createc(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared'
   ,i_code clob
   ,i_owner varchar2 := user  
  ) 
  is
  begin
    begin 
      insert into csource(name,cc_switches,code,owner)
        values(i_name,i_cc_switches,i_code,i_owner);
      
      exception when DUP_VAL_ON_INDEX then
        update csource set cc_switches = i_cc_switches, code = i_code
          where name = i_name and owner = i_owner;
    end;
    
    commit;
    
    make(i_name, i_cc_switches, i_owner);
  end;
  
  procedure dropc (
    i_name varchar2
   ,i_owner varchar2 := user
  ) 
  is
    l_row urowid;
    l_result clob;
    l_rm_cmd varchar2(4000);
    l_dir    varchar2(4000) := 
      rtrim(getPath('ORACLE_LIB'), getPathSeperator) || getPathSeperator;
  begin
    select bin || ' ' || args into l_rm_cmd from commands where cmd = 'rm';
    
    select rowid into l_row from csource where name = i_name and owner = i_owner;
    delete from csource 
      where rowid = l_row;
        
    execute immediate 
      'begin :l_result := CMD.GETEXECCMD(:l_rm_cmd || '' '' || :l_dir || :i_name || ''.*''); end;'
        using out l_result, in l_rm_cmd, in l_dir, in i_name;
    
    execute immediate 
      'DROP LIBRARY ' || i_owner || '.' || upper(i_name) || '_LIB';
    
    commit; 
  end;
end;
/
 
