DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'PROJECTS';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <NAME>orasvn_sf</NAME>
  <URL>https://orasvn.svn.sourceforge.net/svnroot/orasvn/</URL>
  <DESCN>OraSVN Project on Sourceforge</DESCN>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/


