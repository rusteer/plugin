package db

import (
	//log "github.com/cihub/seelog"
	_ "github.com/go-sql-driver/mysql"
	"github.com/lunny/xorm"
)

var DB *xorm.Engine

func init() {
	//defer log.Flush()
	//log.Info("Init db start!")
	var err error
	if DB, err = xorm.NewEngine("mysql", "root:123456@/channel?charset=utf8"); err != nil {
		//log.Info("error init db")
		panic(err)
		return
	}
	DB.ShowSQL = true
	DB.ShowDebug = true
	DB.ShowWarn = true
	//log.Info("Init db end!")
}
