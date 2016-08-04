package services

import (
	. "myproject/db"
	. "myproject/models"
	//"fmt"
)

type ChannelActivateService struct {
}

func init(){
	DB.AddTableWithName(ChannelActivate{}, "t_channel_activate").SetKeys(true, "Id")
}

func (service *ChannelActivateService) GetActivateList(channelId int64,fromDate string,toDate string) ([]ChannelActivate, error) {
	var result []ChannelActivate
	_, err := DB.Select(&result, `
		SELECT id, channel_id, stat_date, activate_count, all_activate_count FROM t_channel_activate
		where channel_id=? and  stat_date>=? and stat_date<=?
		order by stat_date desc `, channelId,fromDate,toDate)
	if err!=nil  {
		return nil,err
	}
	return result,nil
}

