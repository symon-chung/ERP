select 
        @s:=@s+1 no, 
      tbl.* 
from operator tbl, (select @s:=0) a ;

 