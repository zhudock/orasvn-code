CREATE OR REPLACE PACKAGE BODY "ORASVN"."SVN" is
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
  g_svn_cmd varchar2(256) := getCommand('svn');

  procedure print_out(i_clob clob)
  is
  begin
    dbms_output.enable(1000000);
    dbms_output.put_line(substr(i_clob,1,1999));
  end;

  procedure new_Project(
     i_name  varchar2
    ,i_url   varchar2
    ,i_descn varchar2
    ,i_pwd   varchar2
    ,i_user  varchar2 := user
  )
  is
    l_result clob;
    l_svn_cmd varchar2(4000) := g_svn_cmd;
    l_path varchar2(4000) :=
      rtrim(getPath('svn_projects'), g_path_seperator) || g_path_seperator ||
       i_name;
  begin
    cmd.mkdir(i_name,l_path);

    l_svn_cmd := l_svn_cmd || ' co --no-auth-cache --non-interactive';
    l_svn_cmd := l_svn_cmd || ' --username=' || i_user;
    l_svn_cmd := l_svn_cmd || ' --password=' || i_pwd;
    l_svn_cmd := l_svn_cmd || ' ' || i_url;
    l_svn_cmd := l_svn_cmd || ' ' || l_path;

    l_result := cmd.getExecCmd(l_svn_cmd,1);
    print_out(l_result);

    insert into projects values(i_name, i_url, i_descn);
    commit;

    --TODO:
    /*
     add cecked out existing sources
     add option to rename schema
    */
  end;

  procedure spool_src(
     i_owner varchar2
    ,i_type varchar2
    ,i_name varchar2
    ,i_project varchar2
  )
  is
    l_type varchar2(30) := i_type;
    l_src clob;
    l_file_name varchar(256) :=
      replace(i_owner || '.' || i_name || '.' || i_type, ' ', '_');
    l_where varchar(4000);
  begin
    -- get optional restrictions
      select data_where into l_where 
        from sources 
        where project_name = i_project
        and   name = i_name
        and   type = i_type
        and   owner = i_owner;        

    -- set transform parameters
    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'SEGMENT_ATTRIBUTES', false);

    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'STORAGE', true);

    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'TABLESPACE', false);

    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'CONSTRAINTS', false);

    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'REF_CONSTRAINTS', false);

    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'CONSTRAINTS_AS_ALTER', false);

    dbms_metadata.set_transform_param(
      dbms_metadata.session_transform, 'SQLTERMINATOR', TRUE);

    dbms_metadata.set_remap_param(
      dbms_metadata.session_transform, 'REMAP_SCHEMA', i_owner, i_owner);
      
    -- convert object types for ddl api
    if l_type = 'PACKAGE' then l_type := 'PACKAGE_SPEC'; end if;
    l_type := replace(l_type,' ','_');

    if l_type = 'USER' then
      l_src := dbms_metadata.get_ddl('USER', i_name, null) || chr(10);
      l_src := l_src ||
        dbms_metadata.GET_GRANTED_DDL ('SYSTEM_GRANT', i_name) ||
        dbms_metadata.GET_GRANTED_DDL ('ROLE_GRANT', i_name) || chr(10);
    elsif l_type = 'USER_GRANTS' then
      l_src :=
        dbms_metadata.GET_GRANTED_DDL ('OBJECT_GRANT', i_name);
    elsif l_type = 'TABLE_DATA' then
      l_src := getTableDataSQL(i_owner,i_name,l_where);
    elsif l_type = 'C' then
      if lower(l_where) = 'chicken_n_egg' then
        l_src := getCDDL(i_name, i_owner, true);
      else
        l_src := getCDDL(i_name, i_owner);
      end if;
    else
      l_src := dbms_metadata.get_ddl(l_type,i_name,i_owner);

      if l_type = 'LIBRARY' then
        l_src := rtrim(l_src, ' ' || chr(10) || chr(13));
        l_src := l_src || chr(10) || '/' || chr(10);
      end if;
    end if;

    -- cleanings
    l_src := ltrim(l_src, ' ' || chr(10) || chr(13));
    -- for some reason / sings are wired placed in extracted ddls
    l_src := replace(l_src, '; /' || chr(10), ';' || chr(10) || '/' || chr(10));
          
    -- spool file
    SVN_FILE.UTL_FILE_WRITE(upper(i_project), l_file_name, l_src);
  end;

  procedure commit_src(
     i_owner varchar2
    ,i_type varchar2
    ,i_name varchar2
    ,i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  )
  is
    l_msg varchar2(256) := '"' || i_msg || '"';
    l_result clob;
    l_svn_cmd varchar2(4000) := g_svn_cmd;
    l_file_name varchar(256) :=
      replace(i_owner || '.' || i_name || '.' || i_type, ' ', '_');
    l_abs_path varchar2(4000) :=
      rtrim(getPath(i_project), g_path_seperator) || g_path_seperator ||
       l_file_name;
  begin
    l_svn_cmd := l_svn_cmd || ' commit --non-interactive';
    l_svn_cmd := l_svn_cmd || ' --username=' || i_user;
    l_svn_cmd := l_svn_cmd || ' --password=' || i_pwd;
    l_svn_cmd := l_svn_cmd || ' -m ' || l_msg;
    l_svn_cmd := l_svn_cmd || ' ''' || l_abs_path || ''''; -- enclose file by '

    l_result := cmd.getExecCmd(l_svn_cmd,1);
    print_out(l_result);
  end;

  procedure spool_and_commit_src(
     i_owner varchar2
    ,i_src_type varchar2
    ,i_src_name varchar2
    ,i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  )
  is
  begin
    spool_src(
       i_owner => i_owner
      ,i_type => i_src_type
      ,i_name => i_src_name
      ,i_project => i_project
    );

    commit_src(
       i_owner => i_owner
      ,i_type => i_src_type
      ,i_name => i_src_name
      ,i_project => i_project
      ,i_pwd => i_pwd
      ,i_user => i_user
      ,i_msg => i_msg
    );
  end;

  procedure add_src(
     i_project  varchar2
    ,i_owner    varchar2
    ,i_src_type varchar2
    ,i_src_name varchar2
    ,i_pwd      varchar2
    ,i_user     varchar2 := user
  )
  is
    l_result clob;
    l_svn_cmd varchar2(4000) := g_svn_cmd;
    l_file_name varchar(256) :=
      replace(i_owner || '.' || i_src_name || '.' || i_src_type, ' ', '_');
    l_abs_path varchar2(4000) :=
      rtrim(getPath(i_project), g_path_seperator) || g_path_seperator ||
       l_file_name;
  begin
    insert into sources(project_name,owner,type,name)
      values (i_project, i_owner, i_src_type, i_src_name);

    spool_src(
       i_owner => i_owner
      ,i_type => i_src_type
      ,i_name => i_src_name
      ,i_project => i_project
    );

    l_svn_cmd := l_svn_cmd || ' add --non-interactive --auto-props';
    l_svn_cmd := l_svn_cmd || ' --username=' || i_user;
    l_svn_cmd := l_svn_cmd || ' --password=' || i_pwd;
    l_svn_cmd := l_svn_cmd || ' ''' || l_abs_path || ''''; -- enclose filenmane by '

    l_result := cmd.getExecCmd(l_svn_cmd,1);
    print_out(l_result);

    commit_src(
       i_owner => i_owner
      ,i_type => i_src_type
      ,i_name => i_src_name
      ,i_project => i_project
      ,i_pwd => i_pwd
      ,i_user => i_user
      ,i_msg => 'init'
    );

    commit;
  end;

  procedure spool_src_all(
     i_project varchar2
  )
  is
  begin
    for tupl in (select * from sources where project_name = i_project) loop
      spool_src(tupl.owner,tupl.type,tupl.name,i_project);
    end loop;
  end;

  procedure commit_src_all(
     i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  )
  is
  begin
    for tupl in (select * from sources where project_name = i_project) loop
      commit_src(tupl.owner,tupl.type,tupl.name,i_project,i_pwd,i_user,i_msg);
    end loop;
  end;

  procedure spool_and_commit_src_all(
     i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  )
  is
  begin
    spool_src_all(i_project);
    commit_src_all(i_project,i_pwd,i_user,i_msg);
  end;

  procedure update_from_svn(
     i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
  )
  is
    l_svn_cmd varchar2(4000) := g_svn_cmd;
    l_path varchar2(4000) := rtrim(getPath(upper(i_project)), g_path_seperator);
    l_file varchar2(4000);
    l_result clob;
    l_line varchar2(4000);

    l_src CLOB;
    l_stmt varchar2(4000);
    l_stmt_lst DBMS_SQLPLUS_SCRIPT.stmt_table;
  begin
    l_svn_cmd := l_svn_cmd || ' update --non-interactive';
    l_svn_cmd := l_svn_cmd || ' --username=' || i_user;
    l_svn_cmd := l_svn_cmd || ' --password=' || i_pwd;
    l_svn_cmd := l_svn_cmd || ' ' || l_path;

    l_result := cmd.getExecCmd(l_svn_cmd,1);
    print_out(l_result);

    /*
    Password for 'CIKIC':
    U    ORASVN.GETCOMMAND.FUNCTION
    Updated to revision 5.
    */
    clob_cursor.init(l_result);
    while clob_cursor.has_next loop
      l_line := clob_cursor.fetch_line;

      -- updated
      if regexp_like(l_line, '^U ') then
        -- TODO LATER: if ddl excute immediate ddl if table alter table
        l_file := regexp_replace(l_line, 'U[[:space:]]+', '');
        l_src := SVN_FILE.UTL_FILE_READ(l_path,l_file);
        dbms_sqlplus_script.parse(l_src, l_stmt_lst);
        for i in 1 .. l_stmt_lst.count loop
          l_stmt := substr(rtrim(
            l_src, '/' || chr(10) || chr(13)),
              l_stmt_lst(i).offset,l_stmt_lst(i).length);

          if nvl(length(l_src),0) > 1 then
            begin
              execute immediate l_stmt;

              exception when others then
                dbms_output.put_line(sqlcode || sqlerrm);
                dbms_output.put_line(dbms_utility.FORMAT_ERROR_BACKTRACE);
            end;
          end if;
        end loop;
      end if;
    end loop;

    -- recompile invalids UTL_RECOMP.recomp_serial('SCOTT');
    for s in (select distinct owner from sources where project_name = i_project) loop
      execute immediate 'begin sys.dbms_utility.compile_schema(''' || s.owner || '''); end;';
    end loop;

    exception when others then
      dbms_output.put_line(sqlcode || sqlerrm);
      dbms_output.put_line(dbms_utility.FORMAT_ERROR_BACKTRACE);
  end;

  procedure gen_install_sql(
     i_project    varchar2
    ,i_pwd        varchar2
    ,i_user       varchar2 := user
    ,i_spool_only boolean := false
  )
  is
    l_result clob;
    l_svn_cmd varchar2(4000) := g_svn_cmd;
    l_install_clob clob := 'set serveroutput on';
    l_file_name varchar(256);
    l_abs_path varchar2(4000) :=
      rtrim(getPath(i_project), g_path_seperator) || g_path_seperator ||
      'install.sql';
    l_recompiled boolean := false;

    procedure insert_recompile is
    begin
      l_install_clob := l_install_clob || chr(10) || 'prompt recomplie schema';

      for s in (select distinct owner from sources where project_name = i_project) loop
        l_install_clob := l_install_clob || chr(10) || 'exec sys.dbms_utility.compile_schema(''' || s.owner || ''');';
      end loop;

      l_install_clob := l_install_clob || chr(10);
    end;
  begin
    l_install_clob := l_install_clob || chr(10) || 'set def off';
    l_install_clob := l_install_clob || chr(10);

    for tupl in (
      select * from src_seq_v where project_name = i_project order by seq
    ) loop
      l_file_name := replace(tupl.owner || '.' || tupl.name || '.' || tupl.type, ' ', '_');
      l_install_clob := l_install_clob || chr(10) || 'prompt ' || l_file_name;
      l_install_clob := l_install_clob || chr(10) || '@' || l_file_name;
      l_install_clob := l_install_clob || chr(10) ;

      if tupl.seq = 16 and not l_recompiled then
        insert_recompile;
        l_recompiled := true;
      end if;
    end loop;

    insert_recompile;
    l_install_clob := l_install_clob || chr(10) || 'exit;';

    SVN_FILE.UTL_FILE_WRITE(upper(i_project),'install.sql',l_install_clob);

    -- add install.sql to svn
    if not i_spool_only then
      l_svn_cmd := l_svn_cmd || ' add --non-interactive --auto-props';
      l_svn_cmd := l_svn_cmd || ' --username=' || i_user;
      l_svn_cmd := l_svn_cmd || ' --password=' || i_pwd;
      l_svn_cmd := l_svn_cmd || ' ' || l_abs_path;

      l_result := cmd.getExecCmd(l_svn_cmd,1);
      print_out(l_result);
    end if;
  end;
end;
/
 
