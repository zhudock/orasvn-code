DECLARE
  l_context DBMS_XMLSTORE.CTXTYPE;
  l_rows    NUMBER;
  p_table_owner varchar2(30) := 'ORASVN';
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>C</TYPE>
  <NAME>extprocshell</NAME>
  <DATA_WHERE>chicken_n_egg</DATA_WHERE>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>CONSTRAINT</TYPE>
  <NAME>SYS_C004154</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>CONSTRAINT</TYPE>
  <NAME>SYS_C004205</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETARGUMENTS</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETBITS</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETCDDL</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETCOMMAND</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETPATH</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETPATHSEPERATOR</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>GETTABLEDATASQL</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>ISWIN</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>FUNCTION</TYPE>
  <NAME>SHELL</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>INDEX</TYPE>
  <NAME>COMMANDS_UI</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>INDEX</TYPE>
  <NAME>SOURCES_UI</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>LIBRARY</TYPE>
  <NAME>EXTPROCSHELL_LIB</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE</TYPE>
  <NAME>CC</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE</TYPE>
  <NAME>CLOB_CURSOR</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE</TYPE>
  <NAME>CMD</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE</TYPE>
  <NAME>SVN</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE</TYPE>
  <NAME>SVN_FILE</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE BODY</TYPE>
  <NAME>CC</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE BODY</TYPE>
  <NAME>CLOB_CURSOR</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE BODY</TYPE>
  <NAME>CMD</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE BODY</TYPE>
  <NAME>SVN</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>PACKAGE BODY</TYPE>
  <NAME>SVN_FILE</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>REF_CONSTRAINT</TYPE>
  <NAME>SYS_C004156</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE</TYPE>
  <NAME>COMMANDS</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE</TYPE>
  <NAME>CSOURCE</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE</TYPE>
  <NAME>PROJECTS</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE</TYPE>
  <NAME>SOURCES</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE_DATA</TYPE>
  <NAME>COMMANDS</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE_DATA</TYPE>
  <NAME>PROJECTS</NAME>
  <DATA_WHERE>name=&apos;orasvn_sf&apos;</DATA_WHERE>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>TABLE_DATA</TYPE>
  <NAME>SOURCES</NAME>
  <DATA_WHERE>project_name=&apos;orasvn_sf&apos;</DATA_WHERE>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>USER</TYPE>
  <NAME>ORASVN</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>USER_GRANTS</TYPE>
  <NAME>ORASVN</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>VIEW</TYPE>
  <NAME>ALL_OBJECTS_V</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>VIEW</TYPE>
  <NAME>SRC_SEQ_V</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>ORASVN</OWNER>
  <TYPE>VIEW</TYPE>
  <NAME>SVN_SOURCES_V</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>PUBLIC</OWNER>
  <TYPE>SYNONYM</TYPE>
  <NAME>ALL_OBJECTS_V</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>PUBLIC</OWNER>
  <TYPE>SYNONYM</TYPE>
  <NAME>SVN</NAME>
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
  p_table_name varchar2(30) := 'SOURCES';
  p_xml     CLOB := q'[<?xml version="1.0"?>
<ROWSET>
 <ROW>
  <PROJECT_NAME>orasvn_sf</PROJECT_NAME>
  <OWNER>PUBLIC</OWNER>
  <TYPE>SYNONYM</TYPE>
  <NAME>SVN_SOURCES_V</NAME>
 </ROW>
</ROWSET>
]';
BEGIN
  l_context := DBMS_XMLSTORE.NEWCONTEXT(p_table_owner || '.' || p_table_name);
  l_rows := DBMS_XMLSTORE.INSERTXML(l_context,p_xml);
  DBMS_XMLSTORE.CLOSECONTEXT(l_context);
END;
/


