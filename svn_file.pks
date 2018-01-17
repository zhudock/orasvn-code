CREATE OR REPLACE PACKAGE "ORASVN"."SVN_FILE" is
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

  procedure utl_file_write (
     i_path       in varchar2
    ,i_filename   in varchar2
    ,i_clob       in clob
  );

  function utl_file_read (
     i_path       in varchar2
    ,i_filename   in varchar2
  ) return clob;
end;
/
 
