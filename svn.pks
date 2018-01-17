CREATE OR REPLACE PACKAGE "ORASVN"."SVN" authid CURRENT_USER is
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

  procedure new_Project(
     i_name  varchar2         -- i.e. orasvn 
    ,i_url   varchar2         -- i.e. http://192.168.137.1:81/svn/test/trunk
    ,i_descn varchar2         -- i.e. very cool project 
    ,i_pwd   varchar2         -- i.e. topSecreet
    ,i_user  varchar2 := user -- i.e. me
  );
  
  procedure spool_src(
     i_owner varchar2
    ,i_type varchar2
    ,i_name varchar2
    ,i_project varchar2
  );
  
  procedure commit_src(
     i_owner varchar2
    ,i_type varchar2
    ,i_name varchar2
    ,i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  );
  
  procedure spool_and_commit_src(
     i_owner varchar2
    ,i_src_type varchar2
    ,i_src_name varchar2
    ,i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  );
  
  procedure add_src(
     i_project  varchar2
    ,i_owner    varchar2
    ,i_src_type varchar2
    ,i_src_name varchar2
    ,i_pwd      varchar2
    ,i_user     varchar2 := user
  );
  
  procedure spool_src_all(
     i_project varchar2
  );
  
  procedure commit_src_all(
     i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  );
  
  procedure spool_and_commit_src_all(
     i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
    ,i_msg varchar2 := ''
  );
 
  procedure update_from_svn(
     i_project varchar2
    ,i_pwd varchar2
    ,i_user varchar2 := user
  );
   
  procedure gen_install_sql(
     i_project    varchar2
    ,i_pwd        varchar2
    ,i_user       varchar2 := user
    ,i_spool_only boolean := false
  );
end;
/
 
