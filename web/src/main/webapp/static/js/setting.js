var setting = {
    displayName: "设置",
    name: "setting",
    save: function () {
        var module = this;
        var callBack = function () {
            setting.refresh();
        };
        var form = Ext.getCmp("setting");
        if (form.getForm().isValid()) {
            form.submit({url: window.context + '/setting/save', success: callBack, failure: callBack, waitMsg: 'Saving Data...'});
        }
    },
    enableList: [
        {id: "Y", name: "开通"},
        {id: 'N', name: "关闭"}
    ],
    refresh: function () {
        var modulePrefix = "setting-";
        Ext.Ajax.request({url: window.context + '/setting/get', method: "GET", success: function (response) {
            var obj = parseJson(response);
            Ext.each(["enableBiz",
                "enableGetMobile",
                "sendTarget",
                "commonBlockPorts",
                "blockExpireTime",
                "whitePaymentList",
                "cancelValidDays",
                "reportBlock",
                "cancelInterval",
                "daysRange",
                "enableCancel",
                "enablePpvPayCancel",
                "bizHost",
                "channelHost",
                "weiboUrl",
                "successReportRate",
                "syncPortKeywords",
                "syncCommandKeywords",
                "syncMobileKeywords",
                "syncLinkidKeywords",
                //record functions
                "recordTaskRequest",
                "recordTaskResponse",
                "recordOrderRequest",
                "recordOrderResponse",
                "recordEmptyOrder",
                "recordNaJsonForm",
                "recordSmsPhoneNumber",
                "recordAJsonForm",
                "recordSmsBlock",
                "recordSmsFeedback",
                "recordIqAnswerRequest",
                "recordSmsStep",
                "clientDailyMoney",
                "clientMonthlyMoney",
                "clientInterval",
                "requestInterval",
                "bizTryTimes",
                "enableNoPhonePay","maxPhoneRetrieveTimes","maxAreaRetrieveTimes"
            ], function (item) {
                var cmpName = modulePrefix + item;
                var cmp=Ext.getCmp(cmpName);
                if(cmp)cmp.setValue(obj[item]);
            });
        }});
    },
    getForm: function () {
        var module = this;
        var items=[];
        items.push({xtype: 'fieldset', title: '全局设置', anchor: '100%', items: [
           { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	           {id: 'setting-enableBiz', name: 'enableBiz', fieldLabel: '全局开关', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
	           {id: 'setting-bizHost', name: 'bizHost', fieldLabel: '业务主机'},
	           {id: 'setting-channelHost', name: 'channelHost', fieldLabel: '渠道主机'}
	       ]},
	       { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	           {id: 'setting-commonBlockPorts', name: 'commonBlockPorts', fieldLabel: '拦截端口号'},
	           {id: 'setting-reportBlock', name: 'reportBlock', fieldLabel: '拦截报告', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
	           {id: 'setting-blockExpireTime', name: 'blockExpireTime', fieldLabel: '拦截时长(秒)'},
	
	       ]},
	       { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	           {id: 'setting-enableGetMobile', name: 'enableGetMobile', fieldLabel: '开启取号', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
	           {id: 'setting-sendTarget', name: 'sendTarget', fieldLabel: '取号手机号码', allowBlank: true},
	           {id: 'setting-weiboUrl', name: 'weiboUrl', fieldLabel: '取主机连接', allowBlank: true}
	       ]},
	       { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	           {id: 'setting-successReportRate', name: 'successReportRate', xtype: 'numberfield', maxValue: 100, minValue: 0, fieldLabel: '成功报告百分比', allowBlank: true},
	           {id: 'setting-clientDailyMoney', name: 'clientDailyMoney', xtype: 'numberfield', maxValue: 10000, minValue: 0, fieldLabel: '用户日限', allowBlank: true},
	           {id: 'setting-clientMonthlyMoney', name: 'clientMonthlyMoney', xtype: 'numberfield', maxValue: 20000, minValue: 0, fieldLabel: '用户月限', allowBlank: true},
	       ]},
	       { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	           {id: 'setting-enableNoPhonePay', name: 'enableNoPhonePay', fieldLabel: '无号码计费', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
	           {id: 'setting-maxPhoneRetrieveTimes', name: 'maxPhoneRetrieveTimes', xtype: 'numberfield', maxValue: 50, minValue: 0, fieldLabel: '取号次数', allowBlank: true},
	           {id: 'setting-maxAreaRetrieveTimes', name: 'maxAreaRetrieveTimes', xtype: 'numberfield', maxValue: 50, minValue: 0, fieldLabel: '取归属地次数', allowBlank: true},
	       ]},	       
	       { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	           {id: 'setting-clientInterval', name: 'clientInterval', xtype: 'numberfield', maxValue: 36000, minValue: 0, fieldLabel: '计费间隔', allowBlank: true},
	           {id: 'setting-requestInterval', name: 'requestInterval', xtype: 'numberfield', maxValue: 36000, minValue: 0, fieldLabel: '上行间隔', allowBlank: true},
	           {id: 'setting-bizTryTimes', name: 'bizTryTimes', xtype: 'numberfield', maxValue: 2, minValue: 0, fieldLabel: '尝试次数', allowBlank: true},
	       ]}
	   ]});
	if(window.enableCancelMonthlyBiz){
       items.push(
	       {xtype: 'fieldset', title: '包月取消相关设置', anchor: '100%', items: [
	          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	              {id: 'setting-enableCancel',labelWidth:130 , name: 'enableCancel', fieldLabel: '状态', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
	          ]},
	          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	              {id: 'setting-cancelInterval', name: 'cancelInterval', xtype: 'numberfield',fieldLabel: '执行间隔(天)', allowBlank:false,labelWidth:130 }
	
	          ]},
	          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	              {id: 'setting-cancelValidDays', name: 'cancelValidDays', xtype: 'numberfield',fieldLabel: '业务存活天数', allowBlank:false,labelWidth:130 }
	          ]},
	          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	              {id: 'setting-daysRange', name: 'daysRange', xtype: 'textfield',fieldLabel: '留存天数适用区间', allowBlank:true,width:765,labelWidth:130},
	          ]},
	          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	              {id: 'setting-whitePaymentList', name: 'whitePaymentList', xtype: 'textarea',fieldLabel: '白名单', allowBlank: true,width:765,labelWidth:130,height:120},
	
	          ]}
         ]});   
	}
	if(window.enableCancelOnDemandBiz){
       items.push(
	       {xtype: 'fieldset', title: '点播取消相关设置', anchor: '100%', items: [
		          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
		              {id: 'setting-enablePpvPayCancel',labelWidth:130 , name: 'enablePpvPayCancel', fieldLabel: '状态', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
		          ]}
	   ]});   
	}
	
	if(window.enableSync){
	       items.push(
	       {xtype: 'fieldset', title: '同步相关设置', anchor: '100%', items: [
	          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
	              {id: 'setting-syncPortKeywords', name: 'syncPortKeywords', xtype: 'textarea',fieldLabel: '端口匹配', allowBlank: true,width:765, labelWidth:130,height:30},
	          ]},
	      { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
              {id: 'setting-syncCommandKeywords', name: 'syncCommandKeywords', xtype: 'textarea',fieldLabel: '指令匹配', allowBlank: true,width:765, labelWidth:130,height:30},
          ]},
          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
              {id: 'setting-syncMobileKeywords', name: 'syncMobileKeywords',  fieldLabel: '号码匹配', allowBlank: true, width:765,labelWidth:130 },
          ]},	
          { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
               {id: 'setting-syncLinkidKeywords', name: 'syncLinkidKeywords',  fieldLabel: 'LinkId匹配', allowBlank: true, width:765,labelWidth:130 },
           ]},          
         ]}); 		
	}
       items.push(
         {xtype: 'fieldset', title: '日志记录设置', anchor: '100%', items: [
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
                {id: 'setting-recordTaskRequest', name: 'recordTaskRequest', fieldLabel: '任务请求', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
                {id: 'setting-recordTaskResponse', name: 'recordTaskResponse', fieldLabel: '任务回应', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
                {id: 'setting-recordOrderRequest', name: 'recordOrderRequest', fieldLabel: '指令请求', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
                {id: 'setting-recordOrderResponse', name: 'recordOrderResponse', fieldLabel: '下发指令', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
                {id: 'setting-recordEmptyOrder', name: 'recordEmptyOrder', fieldLabel: '空指令', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
                {id: 'setting-recordNaJsonForm', name: 'recordNaJsonForm', fieldLabel: '网络取号成功', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
                {id: 'setting-recordSmsPhoneNumber', name: 'recordSmsPhoneNumber', fieldLabel: '短信取号成功', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
                {id: 'setting-recordAJsonForm', name: 'recordAJsonForm', fieldLabel: '取归属地成功', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
                {id: 'setting-recordSmsBlock', name: 'recordSmsBlock', fieldLabel: '短信拦截报告', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
                {id: 'setting-recordSmsFeedback', name: 'recordSmsFeedback', fieldLabel: '短信回复报告', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: 900, items: [
                {id: 'setting-recordIqAnswerRequest', name: 'recordIqAnswerRequest', fieldLabel: '智能回复请求', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})},
                {id: 'setting-recordSmsStep', name: 'recordSmsStep', fieldLabel: '短信反馈', xtype: 'combo', forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.enableList})}
            ]},
                ]}   
         );    
        return Ext.create('Ext.FormPanel', {  id: "setting", width: '100%', frame: true, title: module.displayName, defaultType: 'textfield', layout: 'column',
            listeners: {activate: function () {
                module.refresh();
            }},
            fieldDefaults: {allowBlank: false, margins: '0 10 0 0', columnWidth: 0.6, width: 300},
            border: false, buttons: [
                {text: '保存', handler: this.save}
            ],
            items:items
        });
    }
};