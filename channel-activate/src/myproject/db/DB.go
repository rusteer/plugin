package db

import (
	//log "github.com/cihub/seelog"
	_ "github.com/go-sql-driver/mysql"
	"database/sql"
	"github.com/coopernurse/gorp"
	"github.com/astaxie/beego"
	"log"
	"os"
)

var DB *gorp.DbMap

func init() {
	DB = initDb()
}
func checkErr(err error, msg string) {
	if err != nil {
		log.Fatalln(msg, err)
	}
}
func initDb() *gorp.DbMap {
	user := beego.AppConfig.String("mysqluser")
	pass := beego.AppConfig.String("mysqlpass")
	dbName := beego.AppConfig.String("mysqldb")
	db, err := sql.Open("mysql", user+":"+pass+"@/"+dbName)
	checkErr(err, "Open DB error")
	// construct a gorp DbMap
	dbmap := &gorp.DbMap{Db: db, Dialect: gorp.MySQLDialect{"InnoDB", "UTF8"}}
	dbmap.TraceOn("[gorp]", log.New(os.Stdout, "myapp:", log.Lmicroseconds))
	return dbmap
}
