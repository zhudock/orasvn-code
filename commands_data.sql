DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'COMMANDS';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <CMD>rm</CMD>
  <BIN>rm</BIN>
  <ARGS>-f</ARGS>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/

DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'COMMANDS';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <CMD>mkdir</CMD>
  <BIN>mkdir</BIN>
  <ARGS>-p</ARGS>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/

DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'COMMANDS';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <CMD>path_seperator</CMD>
  <BIN>/</BIN>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/

DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'COMMANDS';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <CMD>svn</CMD>
  <BIN>/usr/bin/svn</BIN>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/

DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'COMMANDS';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <CMD>cc</CMD>
  <BIN>/usr/bin/gcc</BIN>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/


