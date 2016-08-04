package controllers

import "github.com/astaxie/beego"
import . "myproject/services"
import "time"
import "net/url"
//import "log"
//import . "myproject/models"
import "fmt"

type AdminController struct {
	beego.Controller
	service ChannelService
	channelActivateService ChannelActivateService
	channelAccessService ChannelAccessService
}

func (this *AdminController) Login() {
	beego.ReadFromRequest(&this.Controller)
	//fmt.Printf(flash.Data["error"]);
	this.Data["redirect"]=this.GetString("redirect");
	this.TplNames="admin/login.html"
}

func (this *AdminController) DoLogout() {
	this.DelSession("admin")
	this.Redirect(this.UrlFor("AdminController.Login"),302)
	return
}


func (this *AdminController) isAdmin(loginName,password string) bool{
	if loginName=="bigbare" && password=="bigbare!!!"  {
		return true;
	}
	if loginName=="zhangbin" && password=="bin!23&"  {
		return true;
	}
	return false;
}


func (this *AdminController) DoLogin() {
	loginName:=this.GetString("name")
	password:=this.GetString("password")
	redirectUrl:=this.GetString("redirect");
	fmt.Printf("redirectUrl=%s\n",redirectUrl);
	if this.isAdmin(loginName,password) {
		this.SetSession("admin",true);
		if len(redirectUrl)>0{
			this.Redirect(redirectUrl,302);
		}else {
			this.Redirect(this.UrlFor("AdminController.List"), 302)
		}
		return;
	}

	flash:=beego.ReadFromRequest(&this.Controller)
	flash.Error("用户名或者密码错误!")
	flash.Store(&this.Controller)
	this.Redirect(this.UrlFor("AdminController.Login")+"?redirect="+url.QueryEscape(redirectUrl),302)
}

func (this *AdminController) List() {
	if isAdmin,ok:= this.GetSession("admin").(bool);!isAdmin || !ok {
		newUrl:=this.UrlFor("AdminController.Login")+"?redirect="+url.QueryEscape(this.Ctx.Request.RequestURI);
		fmt.Println(newUrl);
		this.Redirect(newUrl,302)
		return
	}
	format:="2006-01-02";
	dateFrom:=time.Now().Add(time.Hour*24*20*-1);
	dateTo:=time.Now();
	dateFromString:=dateFrom.Format(format);
	dateToString:=dateTo.Format(format);
	if from:=this.GetString("from");len(from)==10{
		dateFromString=from;
		dateFrom,_=time.Parse(format,dateFromString);
	}
	if to:=this.GetString("to");len(to)==10{
		dateToString=to;
		dateTo,_=time.Parse(format,dateToString);
	}


	this.Data["dateFrom"]=dateFromString;
	this.Data["dateTo"]=dateToString;

	var activateCount int64=0;
	var allActivateCount int64=0;
	var channelId int64=0;
	if channelArray,err:=this.service.GetList(); err==nil {
		this.Data["channels"]=channelArray;
		channelId=channelArray[0].Id;
	}
	if id,err:=this.GetInt("channelId");id>0 && err==nil{
		channelId=id;
	}

	type Stat struct{StatDate string;ActivateCount int64;AllActivateCount int64;AccessCount int64}
	statSlice:=[]*Stat{};
	dataMap:=make(map[string]*Stat)
	dateTmp:=dateTo;
	for{
		if dateTmp.Before(dateFrom){ break;}
		stat:=&Stat{StatDate:dateTmp.Format(format)};
		dataMap[stat.StatDate]=stat;
		statSlice=append(statSlice,stat);
		dateTmp=dateTmp.Add(time.Hour*-24);
	}

	if channel,err:=this.service.FindById(channelId);err==nil{
		this.Data["selectedChannel"]=channel;
		result,_:=this.channelActivateService.GetActivateList(channelId,dateFromString,dateToString);
		for _,stat:=range result{
			data:=dataMap[stat.StatDate];
			data.ActivateCount =stat.ActivateCount;
			data.AllActivateCount=stat.AllActivateCount;
			activateCount=activateCount+stat.ActivateCount;
			allActivateCount=allActivateCount+stat.AllActivateCount;
		}
		accessStatArray,_:=this.channelAccessService.GetAccessList(channelId,dateFromString,dateToString);
		for _,stat:=range accessStatArray{
			data:=dataMap[stat.StatDate];
			data.AccessCount =stat.AccessCount;
		}

	}
	this.Data["statSlice"]=statSlice;
	this.Data["activateCount"]=activateCount;
	this.Data["allActivateCount"]=allActivateCount;
	this.TplNames="admin/list.html"
}



