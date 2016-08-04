package models

type Channel struct{
	Id int64
	Uuid string
	Name string
	LoginName string `db:"login_name"`
	LoginPassword string `db:"login_password"`
	DiscountRate int `db:"discount_rate"`
	OnlySystemApp bool `db:"only_system_app"`
	TopFreeCount int `db:"top_free_count"`
	DelayChargeSeconds int64 `db:"delay_charge_seconds"`
}
