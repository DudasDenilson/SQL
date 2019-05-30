set SERVEROUTPUT ON
set define off

declare
v_blob blob;
v_variavel varchar2(32000);

begin
v_variavel :='<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Email</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <h1>html ou qualquer outra coisa</h1>
</body>
</html>';
 
v_blob := utl_raw.cast_to_raw(v_variavel);
--dbms_output.put_line(v_variavel);

v_variavel := utl_raw.cast_to_varchar2(v_blob);
--dbms_output.put_line(v_variavel);


update owner.table_name set column_name = v_blob where column_name1 = algum_valor;

--insert into owner.Other_tb_name (column_name2) values (v_blob);

commit;
end;

SHOW ERRORS
