package services

import (
	. "myproject/db"
	. "myproject/models"
	//"fmt"
)

type ChannelService struct {
}

func init(){
	DB.AddTableWithName(Channel{}, "t_channel").SetKeys(true, "Id")
}

func (service *ChannelService) FindByLoginName(loginName string) (*Channel, error) {
	channel:=Channel{ }
	err:= DB.SelectOne(&channel, "SELECT id, uuid, name, login_name, login_password, discount_rate, only_system_app, top_free_count, delay_charge_seconds  FROM t_channel where login_name=?", loginName)
	if err!=nil  {
		return nil,err
	}
	return &channel,nil
}

func (service *ChannelService) FindById(id int64) (*Channel, error) {
	channel:=Channel{ }
	err:= DB.SelectOne(&channel, "select  id, uuid, name, login_name, login_password, discount_rate, only_system_app, top_free_count, delay_charge_seconds   from t_channel where id=?", id)
	if err!=nil  {
		return nil,err
	}
	return &channel,nil
}



func (service *ChannelService) GetList() ([]Channel, error) {
	var result []Channel
	_, err := DB.Select(&result, "select  id, uuid, name, login_name, login_password, discount_rate, only_system_app, top_free_count, delay_charge_seconds   from t_channel ")
	if err!=nil  {
		return nil,err
	}
	return result,nil
}

