package controllers

import "github.com/astaxie/beego"
import . "myproject/services"
//import . "myproject/models"
import "time"

type ChannelController struct {
	beego.Controller
	service ChannelService
	channelActivateService ChannelActivateService
}

func (this *ChannelController) Login() {
	 beego.ReadFromRequest(&this.Controller)
	//fmt.Printf(flash.Data["error"]);
	this.TplNames="channel/login.html"
}

func (this *ChannelController) DoLogout() {
	this.DelSession("channel.Id")
	this.DelSession("channel.Name")
	this.Redirect(this.UrlFor("ChannelController.Login"),302)
	return
}

func (this *ChannelController) DoLogin() {
	loginName:=this.GetString("name")
	password:=this.GetString("password")
	channel,err:=this.service.FindByLoginName(loginName)
	if(err==nil){
		if(password==channel.LoginPassword){
			this.SetSession("channel.Id",channel.Id);
			this.SetSession("channel.Name",channel.Name);
			this.Redirect(this.UrlFor("ChannelController.List"),302)
			return
		}
	}
	flash:=beego.ReadFromRequest(&this.Controller)
	flash.Error("用户名或者密码错误!")
	flash.Store(&this.Controller)
	//this.TplNames="channel/login.html"
	this.Redirect(this.UrlFor("ChannelController.Login"),302)
	//this.Redirect("/channel/login",302);
}

func (this *ChannelController) List() {
	name,ok:= this.GetSession("channel.Name").(string)
	id,_:= this.GetSession("channel.Id").(int64)
	if(!ok){
		this.Redirect(this.UrlFor("ChannelController.Login"),302)
		return
	}
	dateFrom:=time.Now().Add(time.Hour*24*20*-1).Format("2006-01-02");
	dateEnd:=time.Now().Format("2006-01-02");
	result,_:=this.channelActivateService.GetActivateList(id,dateFrom,dateEnd)
	this.Data["name"]=name
	this.Data["result"]=result

	this.TplNames="channel/list.html"
}



