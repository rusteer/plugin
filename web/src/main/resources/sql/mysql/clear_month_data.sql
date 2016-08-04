DELETE FROM t_order_record
WHERE order_date < '2014-07-01';
DELETE FROM `t_stat_fees_client`
WHERE `last_fee_time` < '2014-07-01';
DELETE FROM t_stat_fee_client
WHERE `last_fee_time` < '2014-07-01';
DELETE FROM t_stat_fee_clients
WHERE `last_fee_time` < '2014-07-01';
DELETE FROM t_stat_fee_province
WHERE `last_fee_time` < '2014-07-01';
DELETE FROM t_step_record
WHERE create_time < '2014-07-01';
 
 
