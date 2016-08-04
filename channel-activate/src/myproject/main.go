package main

import (
	_ "myproject/routers"
	"github.com/astaxie/beego"
	"net/http"
	"html/template"
)
func page_not_found(rw http.ResponseWriter, r *http.Request){
	t,_:= template.New("404.html").ParseFiles(beego.ViewsPath+"/404.html")
	data :=make(map[string]interface{})
	data["content"] = "page not found"
	t.Execute(rw, data)
}
func handlerError(rw http.ResponseWriter, r *http.Request){
	t,_:= template.New("error.html").ParseFiles(beego.ViewsPath+"/error.html")
	data :=make(map[string]interface{})
	data["content"] = "woooow"
	t.Execute(rw, data)
}
func main() {
	beego.Errorhandler("404",page_not_found)
	beego.Errorhandler("error",handlerError)//this.Abort("error") 来进行异常页面处理
	beego.Run()
}

