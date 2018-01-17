CREATE OR REPLACE PACKAGE BODY "ORASVN"."CLOB_CURSOR" 
IS
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

  g_clob clob;
  g_has_next boolean := false;
  g_file_length  BINARY_INTEGER;
  g_start BINARY_INTEGER := 1;
  
  procedure init(i_clob in clob)
  is
  begin
    g_clob := i_clob;
    g_file_length := dbms_lob.getlength(g_clob);
    g_start := 1;
    if g_file_length > 0 then g_has_next := true; end if;
  end;
  
  function fetch_line return varchar2
  IS
    r_record     VARCHAR2 (240);
    end_pos      INTEGER;  
  BEGIN
    -- check clob
    if g_clob is null then 
      raise_application_error(-20100, 'can not fetch line, clob cursor is closed');
    end if;
    
    -- check length
    if g_file_length is null then return null; end if;
    
    end_pos      :=
      DBMS_LOB.INSTR (lob_loc => g_clob, pattern => CHR (10), offset => g_start);
      
    IF end_pos > 0 THEN
      r_record  :=
        RTRIM (
           DBMS_LOB.SUBSTR(
              lob_loc   => g_clob
             ,amount    => LEAST (end_pos - g_start, 240)
             ,offset    => g_start
            )
           ,CHR (13) || CHR (10)
        );
        
      g_start  := end_pos + 1;
    ELSE
      r_record  := DBMS_LOB.SUBSTR (
         lob_loc   => g_clob
        ,amount    => g_file_length - g_start + 1
        ,offset    => g_start
      );
      
      g_start        := 0;
      g_clob         := null;
      g_file_length  := null;
      g_has_next     := false;
    END IF;
    
    RETURN r_record;
  END fetch_line;
  
  -- iterater for cursor
  function has_next return boolean
  is
  begin
    return g_has_next;
  end;
END clob_cursor;
/
 
