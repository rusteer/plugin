package services

import (
	. "myproject/db"
	. "myproject/models"
	//"fmt"
)

type ChannelAccessService struct {
}

func init(){
	DB.AddTableWithName(ChannelAccess{}, "t_channel_access").SetKeys(true, "Id")
}

func (service *ChannelAccessService) GetAccessList(channelId int64,fromDate string,toDate string) ([]ChannelAccess, error) {
	var result []ChannelAccess
	_, err := DB.Select(&result, `
		SELECT id, channel_id, stat_date, access_count FROM t_channel_access
		where channel_id=? and  stat_date>=? and stat_date<=?
		order by stat_date desc `, channelId,fromDate,toDate)
	if err!=nil  {
		return nil,err
	}
	return result,nil
}

