CREATE OR REPLACE PACKAGE BODY "ORASVN"."CMD" is
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

  g_path_seperator char(1) := getPathSeperator;
  g_spool_folder varchar2(256) := getPath('SVN_SPOOL'); -- '/tmp/';
  g_del_cmd varchar2(256) := getCommand('rm') || ' ' || getArguments('rm'); --'rm -f';
  g_mkdir_cmd varchar2(256) := getCommand('mkdir') || ' ' || getArguments('mkdir'); --'mkdir -p';
  
  function getExecCmd(i_cmd varchar2, do_raise number := 1) return clob
  is
    l_rc number;
    l_sid number := sys_context('USERENV','SID');
    l_cmd varchar2(4000) := i_cmd;
    l_err clob;
    l_result clob;
  begin
    l_cmd := l_cmd || ' 2>' || 
      rtrim(g_spool_folder,g_path_seperator) || g_path_seperator || l_sid ||
      '.err';
    
    l_cmd := l_cmd || ' 1>' ||  
      rtrim(g_spool_folder,g_path_seperator) || g_path_seperator || l_sid ||
      '.out'; 
      
    l_rc := orasvn.shell(l_cmd);
    
    if l_rc > 0 then
      l_err := l_rc || ':' || SVN_FILE.UTL_FILE_READ('SVN_SPOOL', l_sid || '.err');
      
      if do_raise > 0 then
        l_rc := orasvn.shell(g_del_cmd || ' ' || 
          rtrim(g_spool_folder,g_path_seperator) || g_path_seperator || l_sid || '.*');
        
        raise_application_error(-20001, substr(l_err,1,512));
      else
        l_result := l_err;
      end if;
    else
      l_result := SVN_FILE.UTL_FILE_READ('SVN_SPOOL', l_sid || '.out');
    end if; 
    
    l_rc := orasvn.shell(g_del_cmd || ' ' || 
      rtrim(g_spool_folder,g_path_seperator) || g_path_seperator || l_sid || '.*');
    
    return l_result;
  end;
  
  procedure mkDir(i_name varchar2, i_path varchar2)
  is
    l_res clob;
  begin
    l_res := getExecCmd(g_mkdir_cmd || ' ' || i_path, 1);
    execute immediate 'create or replace directory ' || i_name ||
      ' as ''' || rtrim(i_path,g_path_seperator) || g_path_seperator || ''''; 
  end;
end;
/
 
