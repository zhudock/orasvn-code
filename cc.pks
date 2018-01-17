CREATE OR REPLACE PACKAGE "ORASVN"."CC" is
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

  function get_make_cmd(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared' 
   ,i_owner varchar2 := user
  ) return varchar2; 
  procedure make(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared'  
   ,i_owner varchar2 := user
   ,i_do_not_compile boolean := false
  );
  procedure createc(
    i_name varchar2
   ,i_cc_switches varchar2 := '-shared'
   ,i_code clob
   ,i_owner varchar2 := user  
  );
  procedure dropc (
     i_name varchar2
    ,i_owner varchar2 := user
  );
end;
/
 
