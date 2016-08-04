package main

import (
	"net/http"
	. "workspace/controllers"
	. "workspace/services"
	. "workspace/tools"
	. "github.com/gorilla/mux"
	"time"
	"fmt"
	"io/ioutil"
	"strconv"
	. "github.com/bitly/go-simplejson"
)


func runWebServer(){
	r := NewRouter()
	//r.HandleFunc("/", helloHandler)
	activate := ActivateController{}
	r.HandleFunc("/activate", activate.Execute)
	//r.HandleFunc("/province2", ProvinceController.Execute2)
	http.Handle("/", r)
	err := http.ListenAndServe(":18080", nil)
	if err != nil {
		panic(err)
	}
}


func getRemoteCount(url string) (int64,error){
	password := "sfe023f_9fd&fwfl";
	resp, err := http.Get(url)
	var result int64
	result=-1;
	if err!=nil{
		return result, err;
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err!=nil{
		return result, err;
	}
	aes:=Aes{}
	jsonObject,err:=aes.Decode(string(body),password)
	if(err!=nil){
		return result, err;
	}
	js,err:=NewJson([]byte(jsonObject))
	if err!=nil{
		return result, err;
	}
	return js.Get("result").Int64()
}


func runBatchJob(){
	ticker := time.NewTicker(time.Second * 5 )
	activateService := ActivateService{}
	bareChannelId:=7
	bareHost:="localhost:7080"
	fishChannelId:=8
	fishHost:="localhost:7080"
	go func() {
		for t := range ticker.C {
			statDate:=time.Now().Format("2006-01-02")

			//----Bare update start----------

			url:="http://"+bareHost+"/channel/data?date="+statDate+"&channel="+strconv.Itoa(bareChannelId)
			count,err:=getRemoteCount(url)
			if(err!=nil){
				fmt.Println(t, err)
				continue
			}
			if(count>-1) {
				activateService.UpdateBareCount(statDate, count)
			}
			//----Bare update end----------
			//----Fish update start-----------------
			url="http://" + fishHost +"/channel/data?date="+statDate+"&channel="+strconv.Itoa(fishChannelId)
			count,err=getRemoteCount(url)
			if(err!=nil){
				fmt.Println(t, err)
				continue
			}
			if(count>-1) {
				activateService.UpdateFishCount(statDate,count)
			}
			//----Fish update end-------------------
		}
	}()
}

func main() {
	runBatchJob()
	runWebServer()

}

