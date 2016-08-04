package services

import (
	//"encoding/binary"
	. "workspace/db"
	. "workspace/models"
	"time"
)

type ActivateService struct {
}

func (service *ActivateService) Create(entity *Activate) (affected int64, err error) {
	rows, err := DB.Insert(entity)
	return rows, err
}

func (service *ActivateService) Get(id int64) (*Activate, bool, error) {
	var activate = Activate{}
	has, err := DB.Id(id).Get(&activate)
	return &activate, has, err
}


func (service *ActivateService) GetAll() ([]Activate, error) {
	everyone := make([]Activate, 0)
	err:=DB.Find(&everyone)
	return everyone,err
}


func (service *ActivateService) UpdateBareCount(date string,count int64) ( error) {
	createTime:=time.Now().Format("2006-01-02 15:04:05")
	updateTime:=createTime
	sql := `
		INSERT INTO activate
			( stat_date,bare,create_time, update_time) VALUES (?,?,?,?)
		ON DUPLICATE KEY
			update bare=?,update_time=?
	`
	_, err := DB.Exec(sql, date,count, createTime,updateTime, count,updateTime)
	return err
}


func (service *ActivateService) UpdateFishCount(date string,count int64) ( error) {
	createTime:=time.Now().Format("2006-01-02 15:04:05")
	updateTime:=createTime
	sql := `
		INSERT INTO activate
			( stat_date,fish,create_time, update_time) VALUES (?,?,?,?)
		ON DUPLICATE KEY
			update fish=?,update_time=?
	`
	_, err := DB.Exec(sql, date,count, createTime,updateTime, count,updateTime)
	return err
}

/**
只有非空和0的field才会被作为更新的字段
*/
func (service *ActivateService) Update(entity *Activate) (affected int64, err error) {
	id := entity.Id
	return DB.Id(id).Update(entity)
}
