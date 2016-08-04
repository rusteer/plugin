var log = {
    serverUrl: window.context + '/rest/log',
    displayName: "日志",
    name: "log",
    formWidth: 1024,
    sorters: [
        {property: 'createTime', direction: 'desc'}
    ],
    showEditFormFlag: false,
    showId: false,
    showStatus: false,
    showSaveButton: false,
    save: function () {
        save(this);
    },
    typeList: [
        {id: "taskRequest", name: "任务请求"},
        {id: "taskResponse", name: "任务回应"},
        {id: "orderRequest", name: "指令请求"},
        {id: "orderResponse", name: "下发指令"},
        {id: "orderReportForm", name: "指令反馈"},
        {id: "emptyOrder", name: "空指令"},
        {id: "naJsonForm", name: "网络取号成功"},//number and area
        {id: "smsPhoneNumber", name: "短信取号成功"},
        {id: "aJsonForm", name: "取归属地成功"},//area
        {id: "smsBlock", name: "短信拦截报告"},
        {id: "smsFeedback", name: "短信回复报告"},
        {id: "iqAnswerRequest", name: "智能回复"},
        {id: "smsStep", name: "短信反馈"},
        {id: "requestStep", name: "网页反馈"},
        {id: "jsonRequestStep", name: "加密网页反馈"},
        {id: "networkStep", name: "网络反馈"},
        {id: "downloadStep", name: "下载反馈"},
        {id: "callStep", name: "电话反馈"},
        {id: "delayStep", name: "延迟反馈"},
        {id: "endStep", name: "结束反馈"}


    ],
    getGrid: function () {
        var module = this;
        var viewConfig = {getRowClass: function (record, rowIndex, rowParams, store) {
            var result = null;
            var content = record.data.content;
            if (content) {
                var obj = Ext.decode(content);
                if (obj && obj.success == false) result = "disabledEntity";
            }
            return result;
        }};
        var grid = getGrid(module, viewConfig);
        Ext.each(["FilterByChannel","FilterByType", "FilterByProvince", "FilterByMobile", 'FilterByFeeId', 'FilterByDeviceId', 'FilterByUserId', 'FilterByAreaCode', 'FilterByOrderId', 'from', 'to', 'startPage', 'pageSize'], function (item) {
            Ext.getCmp(module.name + "-" + item).on('change', function () {
                module.refresh();
            });
        });
        return grid;
    },
    remove: function (id) {
        remove(this, id);
    },
    getList: function (callBack) {
        var module = this;
        var modulePrefix = module.name + "-";
        var params = {
            type: Ext.getCmp(module.name + "-FilterByType").getValue(),
            provinceId: Ext.getCmp(module.name + "-FilterByProvince").getValue(),
            channelId: Ext.getCmp(module.name + "-FilterByChannel").getValue(),
            phoneNumber: Ext.getCmp(module.name + "-FilterByMobile").getValue(),
            bizId: Ext.getCmp(module.name + "-FilterByFeeId").getValue(),
            deviceId: Ext.getCmp(module.name + "-FilterByDeviceId").getValue(),
            clientId: Ext.getCmp(module.name + "-FilterByUserId").getValue(),
            areaCode: Ext.getCmp(module.name + "-FilterByAreaCode").getValue(),
            orderId: Ext.getCmp(module.name + "-FilterByOrderId").getValue(),
            fromDate: Ext.getCmp(module.name + "-from").getValue(),
            toDate: Ext.getCmp(module.name + "-to").getValue(),
            startPage: Ext.getCmp(module.name + "-startPage").getValue(),
            pageSize: Ext.getCmp(module.name + "-pageSize").getValue()
        }
        Ext.Ajax.request({url: window.context + '/log/', method: "GET", params: params, success: function (response) {
            callBack(parseJson(response));
        }});
    },
    refresh: function () {
        var module = this;
        var f1 = function () {
            refresh(module, function () {
                //module.filterByProvince();
            });
        }
        province.getList(function (provinceList) {
            module.provinceList = provinceList;
            var provinceStore = Ext.getCmp(module.name + "-FilterByProvince").getStore();
            provinceStore.loadData(provinceList);
            provinceStore.filterBy(province.isValidProvince);
            channel.getList(function(channelList){
                var channelStore = Ext.getCmp(module.name + "-FilterByChannel").getStore();
                channelStore.loadData(channelList);
                biz.getList(function (bizList) {
                    module.bizList = bizList;
                    Ext.getCmp(module.name + "-FilterByFeeId").getStore().loadData(bizList);
                    module.filterLoaded = true;
                    f1();
                });
            });
        });
    },
    getColumns: function () {
        var module = this;
        return getColumns(this, [
            {header: '时间', dataIndex: 'createTime', flex: 2, renderer: function (value, meta, record) {
                return "<a href=\"javascript:" + module.name + ".showForm(" + record.index + ")\">" + value + "</a>";
            }},
            {header: '类型', dataIndex: 'type', flex: 2, renderer: function (value) {
                for (var i = 0; i < module.typeList.length; i++) {
                    var obj = module.typeList[i];
                    if (obj.id == value) {
                        return obj.name;
                    }
                }
                return value;
            }},
            {header: '业务名称', dataIndex: 'bizId', flex: 3, renderer: function (value) {
                for (var i = 0; i < module.bizList.length; i++) {
                    var bizObj = module.bizList[i];
                    if (bizObj.id == value) {
                        return bizObj.name;
                    }
                }
            }},
            //{header:'Comments',dataIndex:'comments', flex:1},
            {header: '单号', dataIndex: 'orderId', flex: 1},
            {header: '省份', dataIndex: 'provinceId', flex: 1, renderer: function (value) {
                for (var i = 0; i < module.provinceList.length; i++) {
                    var obj = module.provinceList[i];
                    if (obj.id == value) {
                        return obj.name;
                    }
                }
            }},
            {header: 'IP', dataIndex: 'ip', flex: 1},
            {header: '手机号码', dataIndex: 'phoneNumber', flex: 1},
            //{header:'设备ID',dataIndex:'deviceId', flex:2},
            {header: '用户ID', dataIndex: 'clientId', flex: 2},
            {header: '原始版本', dataIndex: 'sdkVersion', flex: 1},
            {header: '升级版本', dataIndex: 'userAgent', flex: 1, renderer: function (value) {
                if (value) {
                    var flag = "Android "
                    var index = value.indexOf(flag);
                    if (index > 0) {
                        var lastIndex = value.indexOf(";", index + 3);
                        if (lastIndex > 0) {
                            return value.substring(index + flag.length, lastIndex);
                        }
                    }
                }
            }},
            {header: 'IMSI', dataIndex: 'imsi', flex: 1, renderer: function (value) {
                if (value) return value.substring(0, 5);
            }}

            //{header:'用户区号',dataIndex:'areaCode', flex:1},
            //{header:'内容',dataIndex:'content', flex:3,renderer:function(value){return Ext.encode(value); }}
        ]);
    },
    getToolbars: function () {
        var module = this;
        var modulePrefix = module.name + "-";
        var dateFormat = 'Y-m-d H:i:s';
        var fromTime = Ext.util.Format.date(new Date(), dateFormat).substring(0, 10);
        var toTime = Ext.util.Format.date(new Date(), dateFormat).substring(0, 10) + " 23:59:59";
        return [
            {xtype: 'toolbar', dock: 'top', items: [
                {text: '刷新', handler: function () {
                    module.refresh();
                }},
                "-",
                "开始日期:",
                {format: dateFormat, id: modulePrefix + 'from', xtype: 'datefield', value: fromTime, width: 150},
                "-",
                "业务:",
                {id: modulePrefix + 'FilterByFeeId', xtype: 'combo', width: 150, selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                    {property: 'status', direction: 'desc'}
                ], fields: ['id', 'name', 'status']})},
                "-",
                "手机号码:",
                {id: modulePrefix + 'FilterByMobile', xtype: "numberfield", width: 150},
                "-",
                "省份:",
                {id: modulePrefix + 'FilterByProvince', width: 120, xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name', 'status']})},
                "-",
                "用户ID:",
                {id: modulePrefix + 'FilterByUserId', xtype: "numberfield", width: 100},
                "-",
                "开始页面:",
                {id: modulePrefix + 'startPage', xtype: "numberfield", width: 100, value: 0},
                "-",
                "渠道:",
                {id: modulePrefix + 'FilterByChannel', xtype: 'combo', width: 150, selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                    {property: 'status', direction: 'desc'}
                ], fields: ['id', 'name', 'status']})}
            ]
            },
            {xtype: 'toolbar', dock: 'top', items: [
                {text: '刷新', handler: function () {
                    module.refresh();
                }},
                "-",
                "结束日期:",
                {format: dateFormat, id: modulePrefix + 'to', xtype: 'datefield', value: toTime, width: 150},
                "-",
                "单号:",
                {id: modulePrefix + 'FilterByOrderId', xtype: "numberfield", width: 150},
                "-",
                "日志类型:",
                {id: modulePrefix + 'FilterByType', width: 150, xtype: 'combo', displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.typeList})},
                "-",
                "区号:",
                {id: modulePrefix + 'FilterByAreaCode', xtype: "textfield", width: 120},
                "-",
                "设备ID:",
                {id: modulePrefix + 'FilterByDeviceId', xtype: "textfield", width: 100},
                "-",
                "页面大小:",
                {id: modulePrefix + 'pageSize', xtype: "numberfield", width: 100, value: 50, maxValue: 200, minValue: 1}
            ]
            }
        ]
    },
    getFormItems: function () {
        var module = this;
        var modulePrefix = this.name + "-";
        var store = Ext.getCmp(module.name).getStore();
        var recordSelected = store.getAt(module.index);
        var content = recordSelected.get("content");
        var formBody = recordSelected.get("formBody");
        /*if(content && content.content && content.content.response){
         formBody=content.content.response.body;
         content.content.response.body=null;
         }*/
        var comments = recordSelected.get("comments");
        if (comments) comments = "\n" + comments;
        if (!comments) comments = "";
        var list = [];
        list.push({xtype: 'textarea', allowBlank: false, height: formBody ? 400 : 500, width: 1024 - 50, value: content + comments});
        if (formBody) {
            list.push({xtype: 'textarea', allowBlank: false, height: 100, width: 1024 - 50, value: formBody});
        }
        //
        //content=unescape(Ext.encode(content).replace(/\n/,/nnnnnnnnnn/).replace(/\\"/,"ddddddddd").replace(/\\/g,"%")) ;
        //content=content.replace(/nnnnnnnnnn/,"\\n").replace(/ddddddddd/,'\\"').replace(/%"/,'\\"');
        //content=unescape(content).replace(/nnnnnnnnnn/,"\\n");
        //
        return getFormItems(this, list);
    },
    showForm: function (index) {
        var module = this;
        module.index = index
        showForm(this, 1024, 600, 0, function (obj) {
        });
    }
};


 
