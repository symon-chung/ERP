SELECT po_no, part_no, po_date, po_unit, po_curr,po_price, RANK
FROM
    (SELECT po_no, part_no, po_date, po_unit, po_curr,po_price,
        @rn:=CASE WHEN @part <> part_no THEN 1 ELSE @rn+1 END AS RANK,
        @part:=part_no AS part
    FROM
        (SELECT @rn:= 0) AS s,
        (SELECT @part:= 0) AS c,
        (SELECT * FROM porder ORDER BY part_no, po_date DESC ) AS temp
    ) AS temp2 
    where part_no =  '00-BSVO NATURAL 6076'  limit 10000;