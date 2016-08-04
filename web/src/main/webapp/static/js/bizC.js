var biz = {
    serverUrl: window.context + '/rest/biz',
    displayName: "业务",
    name: "biz",
    formWidth: 1024,
    formHeight: 900,
    useMask: true,
    modelFields: [
        {name: 'globalDailyMoney', mapping: 'config.globalDailyMoney', type: "int"}
    ],
    sorters: [
        {property: 'partner', direction: 'asc'},
        {property: 'id', direction: 'asc'}
    ],
    syncMethodList: [
        {id: 1, name: "手动"},
        {id: 2, name: "自动"}
    ],
    paymentCycleList: [
        {id: 1, name: "周结"},
        {id: 2, name: "月结"}
    ],
    paymentTypeList: [
        {id: 1, name: "点播"},
        {id: 2, name: "包月"}
    ],
    confirmTypeList: [
        {value: 0, name: "自动回复"},
        {value: 2, name: "智能回复"}
    ],
    hotLevelList: [
        {value: 1},
        {value: 2},
        {value: 3},
        {value: 4},
        {value: 5},
        {value: 6},
        {value: 7},
        {value: 8},
        {value: 9}
    ],
    getDockItems: function () {
        var toDate = Ext.util.Format.date(new Date(), 'Y-m-d');
        var module = this;
        var modulePrefix = module.name + "-";
        return [
            {id: modulePrefix + 'onlyShowActive', fieldLabel: '只显示活动业务', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: true},
            "-",
            "省份:",
            {id: modulePrefix + 'FilterByProvince', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name', 'status']})},
            "-",
            "手机版本:",
            {id: modulePrefix + 'FilterBySdkVersion', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                {property: 'id', direction: 'asc'}
            ], fields: ['id', 'name']})},
            "渠道:", {id: modulePrefix + 'FilterByChannel', xtype: 'combo', displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [{property: 'id', direction: 'asc'} ], fields: ['id', 'name']})}, "-",
            "-",
            "日期:",
            {text: '上一天', handler: function () {
                module['multiChanging'] = true;
                var fromCmp = Ext.getCmp(module.name + "-from");
                fromCmp.setValue(Ext.Date.add(fromCmp.value, Ext.Date.DAY, -1));
                var toCmp = Ext.getCmp(module.name + "-to");
                module['multiChanging'] = false;
                toCmp.setValue(Ext.Date.add(toCmp.value, Ext.Date.DAY, -1));
            }},
            {format: 'Y-m-d', id: modulePrefix + 'from', xtype: 'datefield', value: toDate},
            {format: 'Y-m-d', id: modulePrefix + 'to', xtype: 'datefield', value: toDate},
            {text: '下一天', handler: function () {
                module['multiChanging'] = true;
                var fromCmp = Ext.getCmp(module.name + "-from");
                fromCmp.setValue(Ext.Date.add(fromCmp.value, Ext.Date.DAY, 1));
                var toCmp = Ext.getCmp(module.name + "-to");
                module['multiChanging'] = false;
                toCmp.setValue(Ext.Date.add(toCmp.value, Ext.Date.DAY, 1));
            }},

            "-"
        ];
    },
    save: function () {
        var module = this;
        if (module.showingMask) return;
        module.showingMask = true;
        fp.getEl().mask("正在保存,请稍后........", "x-mask-loading");
        module.showingMask = false;
        if (fp.getForm().isValid()) {
            var blockedArea = "";
            Ext.Array.each(Ext.getCmp("areaTree").getView().getChecked(), function (rec) {
                blockedArea = blockedArea + rec.get('id') + ",";
            });
            fp.submit({url: window.context + '/biz/save/', params: {blockedArea: blockedArea},
                success: function () {
                    win.close();
                    module.refresh();
                },
                failure: function () {
                    alert("保存失败");
                    window.fp.getEl().unmask();
                }
            });
        }
    },
    getGrid: function () {
        var viewConfig = {getRowClass: function (record) {
            return record.get("status") == "D" ? "disabledEntity" : null;
        }};
        var result = getGrid(this, viewConfig);
        var module = this;
        Ext.each(["from", 'to', "FilterByProvince", 'FilterBySdkVersion', "onlyShowActive","FilterByChannel"], function (item) {
            Ext.getCmp(module.name + "-" + item).on('change', function () {
                    if (module['multiChanging'] !== true) module.refresh();
                }
            );
        });
        return result;
    },
    remove: function (id) {
        remove(this, id);
    },
    getList: function (callBack) {
        var module = this;
        var url = module.serverUrl + "/";
        var fromValue = Ext.util.Format.date(Ext.getCmp(module.name + "-from").value, "Y-m-d");
        var toValue = Ext.util.Format.date(Ext.getCmp(module.name + "-to").value, "Y-m-d");
        var provinceComb = Ext.getCmp(module.name + "-FilterByProvince");
        var onlyShowActive = Ext.getCmp(module.name + "-onlyShowActive").getValue() ? "Y" : "N";
        var channelId=Ext.getCmp(module.name + "-FilterByChannel").getValue();
        var provinceId = provinceComb.getValue();
        if (!provinceId) provinceId = 0;
        var sdkVersion = Ext.getCmp(module.name + "-FilterBySdkVersion").getValue();
        if (!sdkVersion) sdkVersion = 0;
        if (fromValue && toValue && fromValue.length == 10 && toValue.length == 10) {
            Ext.Ajax.request({url: window.context + '/biz/list/?isSuper=' + (window['isSuper'] ? "Y" : "N"), method: "GET",
                params: {from: fromValue, to: toValue, provinceId: provinceId, sdkVersion: sdkVersion, onlyShowActive: onlyShowActive,channelId:channelId},
                success: function (response) {
                    callBack(parseJson(response));
                }});
        } else {
            callBack({});
        }
    },
    refresh: function () {
        var module = this;
        province.getList(function (provinceList) {
            var cmp = Ext.getCmp(module.name + "-FilterByProvince");
            var store = cmp.getStore();
            store.loadData(provinceList);
            store.filterBy(province.isValidProvince);
            client.getSdkVersionList(function (sdkList) {
                Ext.getCmp(module.name + "-FilterBySdkVersion").getStore().loadData(sdkList);
                channel.getList(function (channelList) {
                    Ext.getCmp(module.name + "-FilterByChannel").getStore().loadData(channelList);
                    refresh(module);
                });
            });
        });
    },
    getColumns: function () {
        var module = this;
        var columns = [
            {header: '名称', dataIndex: 'name', flex: 3},
            {header: 'SP', dataIndex: 'partner', flex: 1},
            {header: '周期', dataIndex: 'paymentCycle', flex: 1, renderer: function (value) {
                return value == 1 || value == 2 ? module.paymentCycleList[value - 1].name : '';
            }},
            {header: '类型', dataIndex: 'paymentType', flex: 1, renderer: function (value) {
                return value == 1 || value == 2 ? module.paymentTypeList[value - 1].name : '';
            }},
            {header: '关键字', dataIndex: 'keyword', flex: 1},
            {header: '价格', dataIndex: 'price', flex: 1},
            {header: '分成', dataIndex: 'sharing', flex: 1},
            {header: '热度', dataIndex: 'hotLevel', flex: 1},
            {header: '省份个数', dataIndex: 'provinceCount', flex: 1},
            {header: '省份列表', dataIndex: 'provinceList', flex: 4},
//            {header:'覆盖省份',width:80,renderer:function(value,meta,record){
//                var rule=record.get("areaRule");
//                if(rule){
//                    var obj=Ext.decode(rule);
//                    if(obj && obj.ap){
//                        return obj.ap.length;
//                    }
//                }
//            }}
        ];
        var statColumns=getStatColumns();
        for (var i in statColumns) {
            columns.push(statColumns[i]);
        }
        columns.push({header: '日限', width: 150, renderer: function (value, meta, record) {
            return record.get('clientDailyMoney') + "," + record.get('provinceDailyMoney') + "," + record.get('globalDailyMoney');
        }});
        columns.push({header: '月限', width: 100, dataIndex: 'clientMonthlyMoney'});
        columns.push({header: '间隔', width: 100, renderer: function (value, meta, record) {
            return record.get('clientInterval') + "," + record.get('provinceInterval') + "," + record.get('globalInterval');
        }});
        //columns.push({header:'用户月限',dataIndex:'config', flex:1,renderer:function(value){if(value) return value.clientMonthlyMoney;}});
        columns.push({header: '复制', width: 50, sortable: false, dataIndex: 'actions', renderer: function (value, metaData, record) {
            return "<a href=\"javascript:" + module.name + ".copy(" + record.get('id') + ")\">复制</a>";
        }});
        return getColumns(this, columns);
    },
    getFormItems: function (bizId) {
        var module = this;
        var modulePrefix = this.name + "-";
        var blockCount = 6;
        var prefix = modulePrefix + 'block.';
        var blockAreaArray = [];
        for (var i = 0; i < blockCount; i++) {
            blockAreaArray.push({
                xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, fieldDefaults: {labelAlign: 'top'}, items: [
                    {value: (i + 1) + ":", xtype: "displayfield", width: 20},
                    {width: 100, id: prefix + 'port-' + i, name: 'block.port-' + i, fieldLabel: i > 0 ? "" : '拦截端口号', margins: '0 20 0 0', labelWidth: 80},
                    {width: 200, id: prefix + 'content-' + i, name: 'block.content-' + i, fieldLabel: i > 0 ? "" : '拦截内容', margins: '0 20 0 0', labelWidth: 30},
                    //{width:80,id:prefix+'expireTime-'+i,name :'block.expireTime-'+i,fieldLabel:i>0?"":'过期时间',margins:'0 20 0 0',labelWidth:30},
                    {width: 80, id: prefix + 'reportBlock-' + i, name: 'block.reportBlock-' + i, fieldLabel: i > 0 ? "" : '拦截报告', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: true, labelWidth: 60},
                    {flex: 1, id: prefix + 'isConfirm-' + i, name: 'block.isConfirm-' + i, fieldLabel: i > 0 ? "" : '计费确认', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: false, labelWidth: 60},
                    {width: 1, id: prefix + 'id-' + i, xtype: 'hidden', name: 'block.id-' + i, value: 0}
                ]
            });
        }

        var newBizConfirms = [
            {blockPort: "10", blockContent: "本次密码", content: "regex(本次密码([\\d]*)`1)", type: 0},
            {blockPort: "10", blockContent: "回复任意内容", content: "text(是)", type: 0},
            {blockPort: "10", blockContent: "回复数字", content: "regex(回复数字([\\d]*)`1)", type: 0},
            {blockPort: "10", blockContent: "回复&是", content: "text(是)", type: 0},
            {},
            {},
            {}
        ];
        var editBizConfirms = [
            {},
            {},
            {},
            {}
        ];
        var confirms = bizId ? editBizConfirms : newBizConfirms;
        var confirmAreaArray = [];
        for (var i = 0; i < confirms.length; i++) {
            var confirm = confirms[i];
            confirmAreaArray.push({
                xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 40, fieldDefaults: {labelAlign: 'top'}, items: [
                    {value: (i + 1) + ":", xtype: "displayfield", width: 20},
                    {flex: 1, id: modulePrefix + 'confirm.blockPort-' + i, name: 'confirm.blockPort-' + i, fieldLabel: i > 0 ? "" : '拦截端口号', margins: '0 5 0 0', value: confirm.blockPort},
                    {flex: 2, id: modulePrefix + 'confirm.blockContent-' + i, name: 'confirm.blockContent-' + i, fieldLabel: i > 0 ? "" : '拦截内容', margins: '0 5 0 0', value: confirm.blockContent},
                    {flex: 1, id: modulePrefix + 'confirm.port-' + i, name: 'confirm.port-' + i, fieldLabel: i > 0 ? "" : '回复端口号', margins: '0 5 0 0', value: confirm.port},
                    {flex: 2, id: modulePrefix + 'confirm.content-' + i, name: 'confirm.content-' + i, fieldLabel: i > 0 ? "" : '回复内容', margins: '0 5 0 0', value: confirm.content},
                    {flex: 2, id: modulePrefix + 'confirm.type-' + i, name: 'confirm.type-' + i, value: confirm.type, fieldLabel: i > 0 ? "" : '类型', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'value', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['value', 'name'], data: this.confirmTypeList})},
                    //{width:80,id:modulePrefix+'confirm.expireTime-'+i,name :'confirm.expireTime-'+i,fieldLabel:i>0?"":'过期时间',margins:'0 15 0 0',labelWidth:60},
                    //{width:50,id:modulePrefix+'confirm.type-'+i,name :'confirm.type-'+i,fieldLabel:i>0?"":'类型',margins:'0 15 0 0',labelWidth:60},
                    {flex: 1, id: modulePrefix + 'confirm.reportBlock-' + i, name: 'confirm.reportBlock-' + i, fieldLabel: i > 0 ? "" : '拦截报告', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: true, labelWidth: 30},
                    {flex: 1, id: modulePrefix + 'confirm.reportSuccess-' + i, name: 'confirm.reportSuccess-' + i, fieldLabel: i > 0 ? "" : '成功报告', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: false, labelWidth: 30},
                    {flex: 1, id: modulePrefix + 'confirm.reportFailure-' + i, name: 'confirm.reportFailure-' + i, fieldLabel: i > 0 ? "" : '失败报告', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: true, labelWidth: 30},
                    {id: modulePrefix + 'confirm.id-' + i, xtype: 'hidden', name: 'confirm.id-' + i, value: 0}
                ]
            });
        }

        var basicItems = [];
        basicItems.push({id: modulePrefix + 'syncMethod', name: 'syncMethod', xtype: 'hidden', value: 0});
        basicItems.push({id: modulePrefix + 'tryTimes', name: 'tryTimes', fieldLabel: '尝试次数', xtype: 'hidden', value: 1, width: (module.formWidth - 200) / 5, labelWidth: 80, margins: '0 30 0 0'});
        basicItems.push({id: modulePrefix + 'bizType', name: 'bizType', xtype: 'hidden', value: 1});
        
        basicItems.push({id: modulePrefix + 'name', name: 'name', fieldLabel: '名称', allowBlank: false });
        basicItems.push({id: modulePrefix + 'partner', name: 'partner', fieldLabel: '合作者'});
        basicItems.push({id: modulePrefix + 'carrierOperator', name:'carrierOperator',fieldLabel: '运营商', xtype: 'combo', value: 1, displayField: 'name', valueField: 'value', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['name', 'value'], data: carrierOperatorsTypes})});
        basicItems.push({id: modulePrefix + 'port', name: 'port', fieldLabel: '端口号',listeners: {change: {fn: function (portCmp) {
            if(!module.isEditAction){
            	var cmp=Ext.getCmp(modulePrefix + 'syncPort');
            	if(cmp) cmp.setValue(portCmp.getValue());
            }
        }}}, allowBlank: false});
        basicItems.push({id: modulePrefix + 'command', name: 'command', fieldLabel: '指令',listeners: {change: {fn: function (commandCmp) {
            if(!module.isEditAction){
            	var cmp=Ext.getCmp(modulePrefix + 'syncCommand');
            	if(cmp) cmp.setValue(commandCmp.getValue());
            }
        }}}, allowBlank: false,xtype: 'textarea',height:75 });
        if(window.enableSync){
            basicItems.push({id: modulePrefix + 'syncPort', name: 'syncPort', fieldLabel: '同步端口号', allowBlank: true});
            basicItems.push({id: modulePrefix + 'syncCommand', name: 'syncCommand', fieldLabel: '同步指令', allowBlank: true  });        	
        }
        basicItems.push({id: modulePrefix + 'smsSendTimes', name: 'smsSendTimes', fieldLabel: '短信发送次数', value: 2, xtype: 'numberfield', maxValue: 5, minValue: 1, allowBlank: false });
        basicItems.push({xtype: 'fieldset', title: '属性', anchor: '100%', items: [
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'price', name: 'price', fieldLabel: '价格', allowBlank: false, xtype: 'numberfield', width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 20 0 0'},
                {id: modulePrefix + 'sharing', name: 'sharing', fieldLabel: '分成', allowBlank: false, xtype: 'numberfield',width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 30 0 0'},
                {id: modulePrefix + 'paymentType', width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 30 0 0', value: 1, name: 'paymentType', fieldLabel: '业务类型', allowBlank: false, xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.paymentTypeList})},
                {id: modulePrefix + 'keyword', name: 'keyword', fieldLabel: '关键字', width: (module.formWidth - 200) / 4, labelWidth: 60, margins: '0 20 0 0'},
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'targetVersion', name: 'targetVersion', fieldLabel: '版本要求', allowBlank: false, value: 0, xtype: 'numberfield', width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 20 0 0'},
                {id: modulePrefix + 'hotLevel', width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 30 0 0', allowBlank: false, name: "hotLevel", xtype: 'combo', fieldLabel: '热度', value: 1, displayField: 'value', valueField: 'value', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['value'], data: this.hotLevelList})},
                {id: modulePrefix + 'paymentCycle', width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 30 0 0', value: 2, name: 'paymentCycle', fieldLabel: '结算周期', allowBlank: false, xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name'], data: this.paymentCycleList})},
                {id: modulePrefix + 'bizCode', name: 'bizCode', fieldLabel: '业务代码', width: (module.formWidth - 200) / 4, labelWidth: 60, margins: '0 20 0 0'}
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'reportSuccess', name: 'reportSuccess', fieldLabel: '报告上行成功', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: true, width: (module.formWidth - 200) / 4, labelWidth: 80, margins: '0 30 0 0'},
                {id: modulePrefix + 'reportFailure', name: 'reportFailure', fieldLabel: '报告上行失败', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: true, width: (module.formWidth - 200) / 4, labelWidth: 80, margins: '0 30 0 0'},
                {id: modulePrefix + 'requireImsiImei', name: 'requireImsiImei', fieldLabel: 'IMSI-IMEI必须', xtype: 'checkbox', allowBlank: true, inputValue: 'Y', checked: false, width: (module.formWidth - 200) / 4, labelWidth: 80, margins: '0 30 0 0'},
            ]}
        ]});
        basicItems.push({xtype: 'fieldset', title: '时间日期限制', anchor: '100%', items: [
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'startHour', name: 'startHour', fieldLabel: '开始时间', allowBlank: false, xtype: 'numberfield', value: 7, width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 20 0 0'},
                {id: modulePrefix + 'endHour', name: 'endHour', fieldLabel: '结束时间', xtype: 'numberfield', value: 23, width: (module.formWidth - 200) / 5, labelWidth: 60, margins: '0 30 0 0'},
                {id: modulePrefix + 'startDate', name: 'startDate', format: 'Y-m-d', xtype: 'datefield', fieldLabel: '开始日期', width: (module.formWidth - 200) / 4, labelWidth: 60, margins: '0 20 0 0'},
                {id: modulePrefix + 'endDate', name: 'endDate', format: 'Y-m-d', xtype: 'datefield', fieldLabel: '结束日期', width: (module.formWidth - 200) / 4, labelWidth: 60, margins: '0 20 0 0'},
            ]}
        ]});

        basicItems.push({id: modulePrefix + 'inactiveSeconds', name: 'inactiveSeconds', fieldLabel: '激活时间(秒)', xtype: 'hidden', value: '0' });
        basicItems.push( {xtype: 'fieldset', title: '用户限制', anchor: '100%', items: [
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'clientDailyMoney', name: 'clientDailyMoney', fieldLabel: '信息费日限(分)', xtype: 'numberfield', allowBlank: false, margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 4},
                {id: modulePrefix + 'clientMonthlyMoney', name: 'clientMonthlyMoney', fieldLabel: '信息费月限(分)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 4},
                {id: modulePrefix + 'clientInterval', name: 'clientInterval', fieldLabel: '计费间隔(秒)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 800, width: (module.formWidth - 200) / 4}
            ]}
        ]});

        basicItems.push( {xtype: 'fieldset', title: '省份限制', anchor: '100%', items: [
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'provinceDailyMoney', name: 'provinceDailyMoney', fieldLabel: '信息费日限(分)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 100000000, width: (module.formWidth - 200) / 3},
                {id: modulePrefix + 'provinceInterval', name: 'provinceInterval', fieldLabel: '计费间隔(秒)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 3}
            ]}
        ]});
        basicItems.push({xtype: 'fieldset', title: '全局限制', anchor: '100%', items: [
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'globalDailyMoney', name: 'globalDailyMoney', fieldLabel: '信息费日限(分)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 100000000, width: (module.formWidth - 200) / 3},
                {id: modulePrefix + 'globalInterval', name: 'globalInterval', fieldLabel: '计费间隔(秒)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 3}
            ]}
        ]});
        basicItems.push({xtype: 'fieldset', title: '业务组限制', anchor: '100%', items: [

            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [
                {id: modulePrefix + 'brotherIds', name: 'brotherIds', fieldLabel: '业务组列表', allowBlank: true, width: module.formWidth - 300 },
            ]},
            { xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 200, items: [

                {id: modulePrefix + 'brotherDailyMoney', name: 'brotherDailyMoney', fieldLabel: '信息费日限(分)', xtype: 'numberfield', allowBlank: false, margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 5},
                {id: modulePrefix + 'brotherMonthlyMoney', name: 'brotherMonthlyMoney', fieldLabel: '信息费月限(分)', allowBlank: false, xtype: 'numberfield', margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 5},
                {id: modulePrefix + 'brotherDailyCount', name: 'brotherDailyCount', fieldLabel: '计费次数日限(次)', xtype: 'numberfield', allowBlank: false, margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 5},
                {id: modulePrefix + 'brotherMonthlyCount', name: 'brotherMonthlyCount', fieldLabel: '计费次数月限(次)', xtype: 'numberfield', allowBlank: false, margins: '0 50 0 0', labelWidth: 100, value: 0, width: (module.formWidth - 200) / 5},
            ]}
        ]});
         
        if (window.isSuper) {
            basicItems.push({id: modulePrefix + 'targetClient', name: 'targetClient', fieldLabel: '白名单'});
        }

        var provincePrefix = "biz-allowProvince-";

        var panelItems = [];
        var itemList1 = [];
        var itemList2 = [];
        for (var i = 0; i < 32; i++) {
            var provinceId = i + 1;
            var provinceName = province.list[i]
            if (provinceName) {
                var list = i < 16 ? itemList1 : itemList2;
                list.push({
                    xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 40, fieldDefaults: {labelAlign: 'top', margins: '0 5 0 0'}, items: [
                        {width: 70, id: provincePrefix + 'id-' + provinceId, name: provincePrefix + 'id-' + provinceId, inputValue: provinceId, xtype: "checkbox", boxLabel: provinceName, fieldLabel: i % 16 > 0 ? "" : '省份'},
                        {flex: 1, id: provincePrefix + 'provinceDailyMoney-' + provinceId, name: provincePrefix + 'provinceDailyMoney-' + provinceId, fieldLabel: i % 16 > 0 ? "" : '日限(分)'},
                        {flex: 1, id: provincePrefix + 'provinceInterval-' + provinceId, name: provincePrefix + 'provinceInterval-' + provinceId, fieldLabel: i % 16 > 0 ? "" : '间隔(秒)'},
                    ]
                });
            }
        }
        itemList2.push({
            xtype: 'fieldcontainer', layout: 'hbox', defaultType: 'textfield', width: module.formWidth - 40, fieldDefaults: {labelAlign: 'top', margins: '0 5 0 0'}, items: [
                {boxLabel: '全选/全不选', xtype: 'checkbox', width: 100, listeners: {change: {fn: function (checkbox, checked) {
                    var prefix = "biz-allowProvince-";
                    for (var i = 1; i < 32; i++) {
                        var cmp = Ext.getCmp(provincePrefix + 'id-' + i);
                        if (cmp) cmp.setRawValue(checked);
                    }
                }}} },
                {text: '反选', xtype: "button", handler: function () {
                    var prefix = "biz-allowProvince-";
                    for (var i = 1; i < 32; i++) {
                        var cmp = Ext.getCmp(provincePrefix + 'id-' + i);
                        if (cmp) cmp.setRawValue(!cmp.checked);
                    }
                }}
            ]
        });
        panelItems.push({title: '基本信息', defaultType: 'textfield', items: basicItems});
        panelItems.push({title: '开通省份', defaultType: 'textfield', items: [
            //{id:modulePrefix+'areaRule',name :'areaRule',fieldLabel :'区域',width:module.formWidth-50,xtype:'displayfield'},
            //{id:"allowProvincesGroup",xtype:'checkboxgroup',layout:'column',fieldLabel:'开通省份',cls:'x-check-group-alt',width:module.formWidth-50},
            {xtype: 'fieldcontainer', layout: "hbox", anchor: '100%', width: module.formWidth - 50, items: [
                {width:70,text: '解析省份',xtype:"button",handler:function(){
                    var value=Ext.getCmp(modulePrefix + 'rawProvinces').getValue();
                    if(value){
                        for(var i=0;i<province.list.length;i++){
                            var cmp = Ext.getCmp(provincePrefix + 'id-' + (i+1));
                            if(cmp){
                                cmp.setRawValue(value.indexOf(province.list[i].substr(0,2))>=0);
                            }
                        }
                    }
                }},
                {width:module.formWidth - 140,xtype:"textfield",id: modulePrefix + 'rawProvinces',allowBlank: true,value:"" }
            ]},
            {xtype: 'fieldcontainer', layout: "hbox", id: "allowProvincesGroup", anchor: '100%', width: module.formWidth - 50, items: [
                {flex: 1, xtype: 'fieldset', id: "allowProvincesGroup1", anchor: '100%', height: 525, items: itemList1},
                {flex: 1, xtype: 'fieldset', id: "allowProvincesGroup2", anchor: '100%', height: 525, items: itemList2 },
            ]}
        ]});
        panelItems.push({title: '屏蔽地区', defaultType: 'textfield', items: [
            {xtype: 'checkboxgroup', fieldLabel: '屏蔽地区', width: module.formWidth - 50, cls: 'x-check-group-alt', items: module.newTreePanel()}
        ]});
        panelItems.push({title: '拦截与回复', defaultType: 'textfield', items: [
            {fieldLabel: '说明', xtype: 'displayfield', value: '屏蔽时长和常用屏蔽端口在首页的"设置"选项卡中设置.'},
            {xtype: 'fieldset', title: '短信回复', anchor: '100%', items: confirmAreaArray},
            {xtype: 'fieldset', title: '短信拦截', anchor: '100%', items: blockAreaArray}
        ]});
        panelItems.push({title: '指令', defaultType: 'textfield', items: [
            {fieldLabel: '说明', xtype: 'displayfield', width: module.formWidth - 50, value: '以下信息只用来显示业务指令,不需要编辑'},
            {id: modulePrefix + 'order', name: 'order', xtype: 'textarea', allowBlank: true, height: module.formHeight - 150, width: module.formWidth - 50}
        ]});
        return getFormItems(this, [
            {xtype: 'tabpanel', activeTab: 0, defaults: { bodyStyle: 'padding:1px', width: module.formWidth - 50 }, items: panelItems}
        ]);
    },
    newTreePanel: function () {
        var module = this;
        return Ext.create('Ext.tree.Panel', {id: "areaTree", store: Ext.create('Ext.data.TreeStore', {listeners: {'load': module.umMaskForm},
            proxy: {type: 'ajax', url: window.context + '/biz/areatree/?id=' + window.businessId} }), rootVisible: false, useArrows: true, frame: true, width: module.formWidth - 140, height: module.formHeight - 140});
    },
    selectProvince: function (bizObj) {
        console.log(bizObj);
        if (bizObj) {
            var rule = Ext.decode(bizObj.areaRule);
            console.log(rule);
            if (rule) {
                var idPrefix = "biz-allowProvince-id-";

                if (rule.ap) {
                    for (var i in rule.ap) {
                        var comp = Ext.getCmp(idPrefix + rule.ap[i]);
                        //console.log(comp);
                        if (comp) comp.setValue(true);
                    }
                } else if (rule.provinces) {
                    var dailyMoneyPrefix = "biz-allowProvince-provinceDailyMoney-";
                    var intervalPrefix = "biz-allowProvince-provinceInterval-"
                    for (var i in rule.provinces) {
                        var obj = rule.provinces[i];
                        if (obj.enabled) Ext.getCmp(idPrefix + i).setValue(true);
                        if (obj.dailyMoney) Ext.getCmp(dailyMoneyPrefix + i).setValue(obj.dailyMoney);
                        if (obj.interval) Ext.getCmp(intervalPrefix + i).setValue(obj.interval);
                    }
                }
            }
        }

    },
    umMaskForm: function (treestore, node, record) {
        window.fp.getEl().unmask();
    },
    copy: function (id) {
        this.showForm(id, true);
    },
    showForm: function (id, isCopyAction) {
    	var module = this;
        module.isCopyAction = isCopyAction;
        module.isEditAction= !isCopyAction && id>0;
        window.bizObj = null;
        var modulePrefix = this.name + "-";
        window.businessId = id;
        showForm(module, module.formWidth, module.formHeight, id, function (obj) {
            window.bizObj = obj;
            var fields = ['hotLevel', 
                          "port", 
                          "command", 
                          "syncPort",
                          "syncCommand",
                          "smsSendTimes",
                          "carrierOperator",
                          "name", "partner", "price", "sharing", "bizType", "areaRule", "targetClient", "targetVersion", "syncMethod", "paymentCycle",
                "clientDailyMoney",
                'requireImsiImei',
                "clientMonthlyMoney",
                "clientInterval",
                "globalDailyMoney",
                "globalInterval",
                "provinceDailyMoney",
                "provinceInterval",
                "startDate",
                "endDate",
                "startHour",
                "endHour",
                "paymentType",
                "keyword","bizCode",
                'brotherIds', 'brotherDailyMoney', 'brotherMonthlyMoney', 'brotherDailyCount', 'brotherMonthlyCount'
            ];
            fields.push("order");
            fields.push("reportSuccess");
            fields.push("reportFailure");
            Ext.each(fields, function (item) {
                var cmp = Ext.getCmp(modulePrefix + item);
                if (cmp)  cmp.setValue(obj[item]);
            });
            if (module.isCopyAction) Ext.getCmp(modulePrefix + 'id').setValue(null);
            var blockSet = obj.blockSet;
            if (blockSet && blockSet.length > 0) {
                for (var i = 0; i < blockSet.length; i++) {
                    var block = blockSet[i];
                    Ext.each(["id", "port", "content", "reportBlock", "isConfirm"], function (item) {
                        var cmpName = modulePrefix + 'block.' + item + '-' + i;
                        Ext.getCmp(cmpName).setValue(block[item]);
                    });
                    if (window.isCopyAction) Ext.getCmp(modulePrefix + 'block.id-' + i).setValue(null);

                }
            }
            var feedbackSet = obj.feedbackSet;
            if (feedbackSet && feedbackSet.length > 0) {
                for (var i = 0; i < feedbackSet.length; i++) {
                    var feedback = feedbackSet[i];
                    Ext.each(["id", "blockContent", "blockPort", "content", "reportBlock", "reportSuccess", "reportFailure", "port", "type"], function (item) {
                        var cmpName = modulePrefix + 'confirm.' + item + '-' + i;
                        Ext.getCmp(cmpName).setValue(feedback[item]);
                    });
                    if (window.isCopyAction) Ext.getCmp(mohdulePrefix + 'confirm.id-' + i).setValue(null);
                }
            }
            module.selectProvince(window.bizObj);
        }, id);
    }
};


 
