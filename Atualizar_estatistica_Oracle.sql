declare 
v_tb varchar2(300);
begin
 for stale in (select * from DBA_TAB_STATISTICS where STALE_STATS = 'YES' and owner = 'OWNER' -- and num_rows <10000000 
 ) loop 
	 --v_tb := stale.table_name;
	 DBMS_OUTPUT.PUT_LINE('Iniciando processo em ' || stale.table_name );
	 DBMS_STATS.GATHER_TABLE_STATS(OWNNAME=>  stale.owner   , TABNAME=>  stale.table_name  , ESTIMATE_PERCENT=>20);
	 
	 DBMS_OUTPUT.PUT_LINE('Finalizado ' || stale.table_name);
	 DBMS_OUTPUT.PUT_LINE('------------------------------------');
 end loop;
 
 EXCEPTION
 	when OTHERS then 
 	DBMS_OUTPUT.PUT_LINE('Houve erro');
 
 
end;