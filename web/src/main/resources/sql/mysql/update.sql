2014-11-12
ALTER TABLE `plugin`.`t_package` ADD COLUMN `activate_component` VARCHAR(245) NULL  AFTER `app_name` ;

2014-11-17
ALTER TABLE `plugin`.`t_super_setting` ADD COLUMN `enable_sync` TINYINT(1) NOT NULL DEFAULT false  AFTER `enable_cancel_on_demand_biz` ;
ALTER TABLE `plugin`.`t_biz` ADD COLUMN `sync_port` VARCHAR(245) NULL  AFTER `biz_code` , ADD COLUMN `sync_command` VARCHAR(245) NULL  AFTER `sync_port` ;

ALTER TABLE `plugin`.`t_biz` 
ADD INDEX `syncPort` (`sync_port` ASC) ;
ALTER TABLE `plugin`.`t_biz` 
ADD INDEX `syncCommand` (`sync_command` ASC) ;


2014-11-18
ALTER TABLE `plugin`.`t_order_record` ADD COLUMN `success` TINYINT NOT NULL DEFAULT 0  AFTER `latest_step_time` ;

2014-11-19:
ALTER TABLE `plugin`.`t_setting` 
	ADD COLUMN `enable_no_phone_pay` CHAR(1) NULL  AFTER `enable_ppv_pay_cancel` , 
	ADD COLUMN `max_phone_retrieve_times` INT(11) NOT NULL DEFAULT 0  AFTER `enable_no_phone_pay` , 
	ADD COLUMN `max_area_retrieve_times` INT(11) NOT NULL DEFAULT 0  AFTER `max_phone_retrieve_times` ;

2014-11-20:
	ALTER TABLE `plugin`.`t_biz` ADD COLUMN `carrier_operator` INT(11) NOT NULL DEFAULT 1  AFTER `sync_command` ;
	
2014-11-21:
	ALTER TABLE `plugin`.`t_setting` 
		ADD COLUMN `sync_port_keywords` VARCHAR(1000) NULL  AFTER `max_area_retrieve_times` , 
		ADD COLUMN `sync_command_keywords` VARCHAR(1000) NULL  AFTER `sync_port_keywords` , 
		ADD COLUMN `sync_mobile_keywords` VARCHAR(1000) NULL  AFTER `sync_command_keywords` , 
		ADD COLUMN `sync_linkid_keywords` VARCHAR(1000) NULL  AFTER `sync_mobile_keywords` ;
2014-11-22:
	ALTER TABLE `plugin`.`t_biz` ADD COLUMN `sms_send_times` INT(11) NOT NULL DEFAULT 1  AFTER `carrier_operator` ;

