package models

type ChannelActivate struct {
	Id int64
	ChannelId int64 `db:"channel_id"`
	StatDate string `db:"stat_date"`
	ActivateCount int64 `db:"activate_count"`
	AllActivateCount int64 `db:"all_activate_count"`
}
