CREATE OR REPLACE PACKAGE BODY "ORASVN"."SVN_FILE" is
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
  )
  is
    l_output_file  utl_file.file_type;
  begin
    l_output_file := utl_file.fopen (upper(i_path), i_filename, 'W');

    clob_cursor.init(i_clob);
    while clob_cursor.has_next loop
      utl_file.put_line (l_output_file, clob_cursor.fetch_line);
    end loop;

    utl_file.fclose(l_output_file);

    exception when others then
      utl_file.fclose(l_output_file);
      raise_application_error(-20001, i_path || ':' || i_filename || chr(10) || 
        'backtrace: '|| DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  end;

  function utl_file_read (
     i_path       in varchar2
    ,i_filename   in varchar2
  ) return clob
  is
    l_input_file   utl_file.file_type;
    l_input_buffer varchar2(4000);
    l_result       clob;
    l_exit         boolean := false;
  begin
    l_input_file := utl_file.fopen (i_path,i_filename, 'R');

    loop
      exit when l_exit;

      begin
        utl_file.get_line (l_input_file, l_input_buffer);
        l_result := l_result || rtrim(l_input_buffer, chr(10)||chr(13)) || chr(10);

        exception when no_data_found then
          l_exit := true;
      end;
    end loop;

    utl_file.fclose(l_input_file);
    return l_result;

    exception when others then
      utl_file.fclose(l_input_file);
      raise_application_error(-20001, i_filename || chr(10) || 
        'backtrace: '|| DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  end;
end;
/
 
