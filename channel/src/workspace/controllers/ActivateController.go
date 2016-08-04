package controllers

import (
	//"encoding/json"
	//"io"
	"net/http"
	"html/template"
	 "fmt"
	//"github.com/gorilla/mux"
	//	. "workspace/models"
	. "workspace/services"
)

type ActivateController struct {
	service ActivateService
}

type ActivateData struct{
	Date string
	Count int64
}



func (this *ActivateController) Execute(w http.ResponseWriter, request *http.Request) {
	t,err:=template.ParseFiles("/workspace/plugin/code/channel/src/workspace/html/list.html")
	if(err!=nil){
		 fmt.Println(  err)
		return
	}
	t.Execute(w,nil);
	/*
	result, err := this.service.GetAll()
	if err == nil {
		bytes, err := json.Marshal(result)
		if err == nil {
			io.WriteString(w, string(bytes))
		}
	}
*/
}
