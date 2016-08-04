USE PLUGIN;
GRANT SELECT ON mysql.proc TO plugin@'localhost';
FLUSH PRIVILEGES;
-- 建立存储过程
DROP PROCEDURE IF EXISTS revert_order;
DELIMITER //
CREATE PROCEDURE revert_order(IN order_id BIGINT(21))
  BEGIN
    SET @sqlstr = CONCAT(
        "select @bizId:=a.id,@bizPrice:=a.price,@provinceId:=b.province_id,@mobile:=c.phone_number,@orderDate:=b.order_date,@orderMonth:=left(b.order_date,7)  from t_biz a,t_order_record b,t_client c where a.id=b.fee_id and c.id=b.client_id and b.id=",
        order_id);
    PREPARE stmt1 FROM @sqlstr;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

-- #select @bizId,@bizPrice ,@provinceId ,@mobile ,@orderDate,@orderMonth;


    SET @sqlstr = "update t_stat_fee_client set date_order_money=date_order_money-? ,month_order_money=month_order_money-?  where fee_id=? and mobile=? and stat_date=? and stat_month=?";
    PREPARE stmt1 FROM @sqlstr;
    EXECUTE stmt1
    USING @bizPrice, @bizPrice, @bizId, @mobile, @orderDate, @orderMonth;
    DEALLOCATE PREPARE stmt1;


    SET @sqlstr = "update t_stat_fee_clients set date_order_money=date_order_money-? ,month_order_money=month_order_money-? where fee_id=? and stat_date=? and stat_month=?";
    PREPARE stmt1 FROM @sqlstr;
    EXECUTE stmt1
    USING @bizPrice, @bizPrice, @bizId, @orderDate, @orderMonth;
    DEALLOCATE PREPARE stmt1;


    SET @sqlstr = "update t_stat_fee_province set date_order_money=date_order_money-? ,month_order_money=month_order_money-? where fee_id=? and province_id=? and stat_date=? and stat_month=?";
    PREPARE stmt1 FROM @sqlstr;
    EXECUTE stmt1
    USING @bizPrice, @bizPrice, @bizId, @provinceId, @orderDate, @orderMonth;
    DEALLOCATE PREPARE stmt1;

    SET @sqlstr = "update t_stat_fees_client set date_order_money=date_order_money-? ,month_order_money=month_order_money-? where mobile=?  and stat_date=? and stat_month=?";
    PREPARE stmt1 FROM @sqlstr;
    EXECUTE stmt1
    USING @bizPrice, @bizPrice, @mobile, @orderDate, @orderMonth;
    DEALLOCATE PREPARE stmt1;

  END;
//
DELIMITER ;

CALL revert_order(920);


 

