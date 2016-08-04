package routers

import (
	"myproject/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/channel/login", &controllers.ChannelController{},"get:Login")
	beego.Router("/channel/login", &controllers.ChannelController{},"post:DoLogin")
	beego.Router("/channel/logout", &controllers.ChannelController{},"get:DoLogout")
	beego.Router("/channel/list", &controllers.ChannelController{},"get:List")

	beego.Router("/admin/login", &controllers.AdminController{},"get:Login")
	beego.Router("/admin/login", &controllers.AdminController{},"post:DoLogin")
	beego.Router("/admin/logout", &controllers.AdminController{},"get:DoLogout")
	beego.Router("/admin/list", &controllers.AdminController{},"get:List")

	beego.Router("/chan/login", &controllers.ChannelControllerV2{},"get:Login")
	beego.Router("/chan/login", &controllers.ChannelControllerV2{},"post:DoLogin")
	beego.Router("/chan/logout", &controllers.ChannelControllerV2{},"get:DoLogout")
	beego.Router("/chan/report", &controllers.ChannelControllerV2{},"get:List")
}
