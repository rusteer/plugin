package models

type ChannelAccess struct {
	Id int64
	ChannelId int64 `db:"channel_id"`
	StatDate string `db:"stat_date"`
	AccessCount int64 `db:"access_count"`
}
