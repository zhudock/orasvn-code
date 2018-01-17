CREATE OR REPLACE FUNCTION "ORASVN"."GETTABLEDATASQL" (
   i_owner varchar2
  ,i_name varchar2
  ,i_where varchar2
) return clob authid CURRENT_USER is
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

  l_sql clob := chr(10);
  l_data clob;
  l_where varchar2(4000) := '';
  
  type rid_list_t is table of UROWID;
  rid_list rid_list_t;
begin
  if i_where is not null then l_where := ' where ' || i_where; end if; 
  
  execute immediate 'select rowid from ' || i_owner || '.' || i_name || l_where
    bulk collect into rid_list;
  
  for i in 1 .. rid_list.count loop
      l_data := DBMS_XMLGEN.GETXML(
        'select * from ' || i_owner || '.' || i_name ||
          ' where rowid=''' || rid_list(i) || '''' );

      l_sql := l_sql || 'DECLARE' ||chr(10);
      l_sql := l_sql || '  l_context DBMS_XMLSTORE.CTXTYPE;' ||chr(10);
      l_sql := l_sql || '  l_rows    NUMBER;' ||chr(10);
      l_sql := l_sql || '  p_table_owner varchar2(30) := ''' || i_owner || ''';' ||chr(10);
      l_sql := l_sql || '  p_table_name varchar2(30) := ''' || i_name || ''';' ||chr(10);
      l_sql := l_sql || '  p_xml     CLOB := q''[' || l_data || ']'';' ||chr(10);      
      l_sql := l_sql || 'BEGIN' ||chr(10);
      l_sql := l_sql || '  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || ''.'' || p_table_name);' ||chr(10); 
      l_sql := l_sql || '  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);' ||chr(10); 
      l_sql := l_sql || '  DBMS_XMLSTORE.CLOSECONTEXT(l_context);' ||chr(10); 
      l_sql := l_sql || 'END;' ||chr(10);
      l_sql := l_sql || '/' ||chr(10)||chr(10);
  end loop;
  
  return l_sql;
end;
/
 
