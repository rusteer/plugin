USE PLUGIN;

-- 建立存储过程
DROP PROCEDURE IF EXISTS clear_biz_data;
DELIMITER //
CREATE PROCEDURE clear_biz_data(IN biz_id BIGINT(21), IN from_time TIMESTAMP, IN to_time TIMESTAMP)
  BEGIN
    DECLARE TMP_TABLE_EXISTS INT;
    DECLARE result INT;
    SELECT
      count(1)
    INTO TMP_TABLE_EXISTS
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_NAME = 'tt_mytemp1';
-- SELECT TMP_TABLE_EXISTS;
    IF TMP_TABLE_EXISTS
    THEN
      SET result = 1;
    ELSE

-- #################t_stat_fee_client###########################
-- #--------------clear date date--------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(order_time,10) as order_date,a.fee_id,b.price as price,c.phone_number as mobile,count(1) as mycount from t_order_record  a, t_biz b,t_client c  where a.fee_id=",
          biz_id, " and a.fee_id=b.id and a.client_id=c.id and c.phone_number is not null and order_time>='", from_time,
          "'  and order_time<='", to_time, "'  group by order_date,fee_id,mobile;");
      SELECT
        @sqlstr AS "execute";

      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fee_client a INNER JOIN tt_mytemp1 b  ON a.fee_id=b.fee_id and a.mobile=b.mobile and a.stat_date=b.order_date SET a.date_order_money=a.date_order_money-b.mycount*b.price;" AS "execute";
      UPDATE t_stat_fee_client a INNER JOIN tt_mytemp1 b
          ON a.fee_id = b.fee_id AND a.mobile = b.mobile AND a.stat_date = b.order_date
      SET a.date_order_money = a.date_order_money - b.mycount * b.price;


      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;

-- #--------------clear month date--------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(a.order_time,7) as order_month,a.fee_id,b.price as price,c.phone_number as mobile,count(1) as mycount from t_order_record  a, t_biz b ,t_client c where a.fee_id=",
          biz_id, " and a.fee_id=b.id and a.client_id=c.id and c.phone_number is not null and  order_time>='",
          from_time, "'  and order_time<='", to_time, "'  group by order_month,fee_id,client_id;");
      SELECT
        @sqlstr AS "execute";

      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fee_client a INNER JOIN tt_mytemp1 b  ON a.fee_id=b.fee_id and a.mobile=b.mobile and a.stat_month=b.order_month SET a.month_order_money=a.month_order_money-b.mycount*b.price;" AS "execute";
      UPDATE t_stat_fee_client a INNER JOIN tt_mytemp1 b
          ON a.fee_id = b.fee_id AND a.mobile = b.mobile AND a.stat_month = b.order_month
      SET a.month_order_money = a.month_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;


-- #################t_stat_fee_clients ###########################
-- #-------------clear date date------------------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(order_time,10) as order_date,fee_id,b.price as price,count(1) as mycount from t_order_record  a, t_biz b  where a.fee_id=",
          biz_id, " and a.fee_id=b.id and order_time>='", from_time, "'  and order_time<='", to_time,
          "'  group by  order_date,fee_id;");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fee_clients a INNER JOIN tt_mytemp1 b  ON a.fee_id=b.fee_id and a.stat_date=b.order_date SET a.date_order_money=a.date_order_money-b.mycount*b.price ;" AS "execute";
      UPDATE t_stat_fee_clients a INNER JOIN tt_mytemp1 b ON a.fee_id = b.fee_id AND a.stat_date = b.order_date
      SET a.date_order_money = a.date_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;

-- #--------------clear month date-----------------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(order_time,7) as order_month,fee_id,b.price as price,count(1) as mycount from t_order_record  a, t_biz b  where a.fee_id=",
          biz_id, " and a.fee_id=b.id and order_time>='", from_time, "'  and order_time<='", to_time,
          "' group by  order_month,fee_id;");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fee_clients a INNER JOIN tt_mytemp1 b  ON a.fee_id=b.fee_id and a.stat_month=b.order_month SET  a.month_order_money=a.month_order_money-b.mycount*b.price;" AS "execute";
      UPDATE t_stat_fee_clients a INNER JOIN tt_mytemp1 b ON a.fee_id = b.fee_id AND a.stat_month = b.order_month
      SET a.month_order_money = a.month_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;


-- #################t_stat_fee_province ###########################
-- #--------------clear date date-----------------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(order_time,10) as order_date,fee_id,b.price as price,province_id ,count(1) as mycount from t_order_record  a, t_biz b  where a.fee_id=",
          biz_id, " and a.fee_id=b.id and  order_time>='", from_time, "'  and order_time<='", to_time,
          "'  group by order_date,fee_id,province_id;");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fee_province a INNER JOIN tt_mytemp1 b  ON a.fee_id=b.fee_id and a.stat_date=b.order_date and a.province_id =b.province_id SET a.date_order_money=a.date_order_money-b.mycount*b.price ;" AS "execute";
      UPDATE t_stat_fee_province a INNER JOIN tt_mytemp1 b
          ON a.fee_id = b.fee_id AND a.stat_date = b.order_date AND a.province_id = b.province_id
      SET a.date_order_money = a.date_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;

-- #--------------clear month date-----------------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(order_time,7) as order_month,fee_id,b.price as price,province_id ,count(1) as mycount from t_order_record  a, t_biz b where fee_id=",
          biz_id, " and a.fee_id=b.id and order_time>='", from_time, "' and order_time<='", to_time,
          "' group by order_month,fee_id,province_id;");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fee_province a INNER JOIN tt_mytemp1 b  ON a.fee_id=b.fee_id and a.stat_month=b.order_month and a.province_id =b.province_id SET  a.month_order_money=a.month_order_money-b.mycount*b.price;" AS "execute";
      UPDATE t_stat_fee_province a INNER JOIN tt_mytemp1 b
          ON a.fee_id = b.fee_id AND a.stat_month = b.order_month AND a.province_id = b.province_id
      SET a.month_order_money = a.month_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;
-- #################t_stat_fees_client ###########################
-- #--------------clear date date-----------------------------

      SELECT
        @bizPrice := price
      FROM t_biz
      WHERE id = biz_id;

      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(a.order_time,10) as order_date,b.phone_number as mobile,", @bizPrice,
          " as price,count(1) as mycount from t_order_record a, t_client b where a.client_id=b.id and a.fee_id=",
          biz_id, " and a.order_time>='", from_time, "'  and a.order_time<='", to_time,
          "'  group by order_date,mobile;");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fees_client a INNER JOIN tt_mytemp1 b  ON a.mobile=b.mobile and a.stat_date=b.order_date SET a.date_order_money=a.date_order_money-b.mycount*b.price ;" AS "execute";
      UPDATE t_stat_fees_client a INNER JOIN tt_mytemp1 b ON a.mobile = b.mobile AND a.stat_date = b.order_date
      SET a.date_order_money = a.date_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;

-- #--------------clear month date-----------------------------
      SET @sqlstr = CONCAT(
          "create table tt_mytemp1 as select left(order_time,7) as order_month,b.phone_number as mobile,", @bizPrice,
          " as price,count(1) as mycount from t_order_record a, t_client b where a.client_id=b.id and fee_id=", biz_id,
          " and order_time>='", from_time, "'  and order_time<='", to_time, "'  group by order_month,mobile;");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SELECT
        "UPDATE t_stat_fees_client a INNER JOIN tt_mytemp1 b  ON a.mobile=b.mobile and a.stat_month=b.order_month SET a.month_order_money=a.month_order_money-b.mycount*b.price ;" AS "execute";
      UPDATE t_stat_fees_client a INNER JOIN tt_mytemp1 b ON a.mobile = b.mobile AND a.stat_month = b.order_month
      SET a.month_order_money = a.month_order_money - b.mycount * b.price;

      SELECT
        "DROP TABLE tt_mytemp1;" AS "execute";
      DROP TABLE tt_mytemp1;

-- #################clear t_order_record ###########################
      SET @sqlstr = CONCAT("delete from t_order_record where fee_id=", biz_id, " and order_time>='", from_time,
                           "'  and order_time<='", to_time, "'");
      SELECT
        @sqlstr AS "execute";
      PREPARE stmt FROM @sqlstr;
      EXECUTE stmt;
      DEALLOCATE PREPARE stmt;

      SET result = 0;
    END IF;
    SELECT
      result;
  END;
//
DELIMITER ;

-- 测试

CALL clear_biz_data(561, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(657, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(663, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(717, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(718, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(719, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(720, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(721, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
CALL clear_biz_data(722, '2014-11-19 13:37:00', '2014-11-20 16:42:00');
 



#select * from t_stat_fee_client

