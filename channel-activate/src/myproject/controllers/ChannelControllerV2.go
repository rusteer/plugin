package controllers

import "github.com/astaxie/beego"
import . "myproject/services"
//import . "myproject/models"
import "time"
/**
于要求的第二个界面,为不让渠道看出是一家
 */
type ChannelControllerV2 struct {
	beego.Controller
	service ChannelService
	channelActivateService ChannelActivateService
}

func (this *ChannelControllerV2) Login() {
	 beego.ReadFromRequest(&this.Controller)
	//fmt.Printf(flash.Data["error"]);
	this.TplNames="channelv2/login.html"
}

func (this *ChannelControllerV2) DoLogout() {
	this.DelSession("channelv2.Id")
	this.DelSession("channelv2.Name")
	this.Redirect(this.UrlFor("ChannelControllerV2.Login"),302)
	return
}

func (this *ChannelControllerV2) DoLogin() {
	loginName:=this.GetString("name")
	password:=this.GetString("password")
	channel,err:=this.service.FindByLoginName(loginName)
	if(err==nil){
		if(password==channel.LoginPassword){
			this.SetSession("channelv2.Id",channel.Id);
			this.SetSession("channelv2.Name",channel.Name);
			this.Redirect(this.UrlFor("ChannelControllerV2.List"),302)
			return
		}
	}
	flash:=beego.ReadFromRequest(&this.Controller)
	flash.Error("用户名或者密码错误!")
	flash.Store(&this.Controller)
	//this.TplNames="channel/login.html"
	this.Redirect(this.UrlFor("ChannelControllerV2.Login"),302)
	//this.Redirect("/channel/login",302);
}

func (this *ChannelControllerV2) List() {
	name,ok:= this.GetSession("channelv2.Name").(string)
	id,_:= this.GetSession("channelv2.Id").(int64)
	if(!ok){
		this.Redirect(this.UrlFor("ChannelControllerV2.Login"),302)
		return
	}
	dateFrom:=time.Now().Add(time.Hour*24*20*-1).Format("2006-01-02");
	dateEnd:=time.Now().Format("2006-01-02");
	result,_:=this.channelActivateService.GetActivateList(id,dateFrom,dateEnd)
	this.Data["name"]=name
	this.Data["result"]=result
	this.TplNames="channelv2/list.html"
}



