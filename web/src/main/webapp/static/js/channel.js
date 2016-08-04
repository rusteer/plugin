var channel = {
    serverUrl: window.context + '/rest/channel',
    displayName: "渠道",
    name: "channel",
    sorters: [
        {property: 'channel', direction: 'asc'}
    ],
    enableList: [
        {id: "Y", name: "Y"},
        {id: 'N', name: "N"}
    ],
    showStatus: false,
    save: function () {
        save(this);
    },
    getGrid: function () {
        var module = this;
        var viewConfig = {getRowClass: function (record, rowIndex, rowParams, store) {
            var result = null;
            if(!record.data.enableFee){
                result = "disabledEntity";
            }
            return result;
        }};
        var result = getGrid(module,viewConfig);
        Ext.each(["from", 'to', "FilterByProvince", 'FilterByCarrierOperator', 'FilterBySdkVersion'], function (item) {
            Ext.getCmp(module.name + "-" + item).on('change', function () {
                if (module['multiChanging'] !== true) module.refresh();
            });
        });
        return result;
    },
    //remove: function(id){remove(this,id);},
    getList: function (callBack) {
        var module = this;
        var params = {
            from: Ext.util.Format.date(Ext.getCmp(module.name + "-from").value, "Y-m-d"),
            to: Ext.util.Format.date(Ext.getCmp(module.name + "-to").value, "Y-m-d"),
            provinceId: Ext.getCmp(module.name + "-FilterByProvince").value,
            sdkVersion: Ext.getCmp(module.name + "-FilterBySdkVersion").getValue()
        };
        var carrierOperator = Ext.getCmp(module.name + "-FilterByCarrierOperator").value;
        console.log(carrierOperator);
        if (carrierOperator !== "") params.carrierOperator = carrierOperator;
        Ext.Ajax.request({url: window.context + '/channelAdmin/list/?isSuper=' + (window['isSuper'] ? "Y" : "N"), method: "GET", params: params, success: function (response) {
            callBack(parseJson(response));
        }});
    },
    getDockItems: function () {
        var toDate = Ext.util.Format.date(new Date(), 'Y-m-d');
        var fromDate = toDate;
        var module = this;
        var modulePrefix = module.name + "-";
        return [
            "省份:", {id: modulePrefix + 'FilterByProvince', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name', 'status']})}, "-",
            "日期:",
            {text: '上一天', handler: function () {
                module['multiChanging'] = true;
                var fromCmp = Ext.getCmp(module.name + "-from");
                fromCmp.setValue(Ext.Date.add(fromCmp.value, Ext.Date.DAY, -1));
                var toCmp = Ext.getCmp(module.name + "-to");
                module['multiChanging'] = false;
                toCmp.setValue(Ext.Date.add(toCmp.value, Ext.Date.DAY, -1));
            }},
            {format: 'Y-m-d', id: modulePrefix + 'from', xtype: 'datefield', value: fromDate},
            {format: 'Y-m-d', id: modulePrefix + 'to', xtype: 'datefield', value: toDate},
            {text: '下一天', handler: function () {
                module['multiChanging'] = true;
                var fromCmp = Ext.getCmp(module.name + "-from");
                fromCmp.setValue(Ext.Date.add(fromCmp.value, Ext.Date.DAY, 1));
                var toCmp = Ext.getCmp(module.name + "-to");
                module['multiChanging'] = false;
                toCmp.setValue(Ext.Date.add(toCmp.value, Ext.Date.DAY, 1));
            }},
            "-",
            "手机版本:", {id: modulePrefix + 'FilterBySdkVersion', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                {property: 'id', direction: 'asc'}
            ], fields: ['id', 'name']})}, "-",
            "运营商:", {id: modulePrefix + 'FilterByCarrierOperator', xtype: 'combo', value: 1, displayField: 'name', valueField: 'value', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['name', 'value'], data: carrierOperatorsTypes})}
        ];
    },
    refresh: function () {
        var module = this;
        province.getList(function (provinceList) {
            var cmp = Ext.getCmp(module.name + "-FilterByProvince");
            var store = cmp.getStore();
            store.loadData(provinceList);
            store.filterBy(province.isValidProvince);
            refresh(module);
        })
    },
    getColumns: function () {
        var columns = [
            {header: '业务序列号', dataIndex: 'uuid', flex: 2},
            {header: '名称', dataIndex: 'name', flex: 1},
            {header: '是否开启计费', dataIndex: 'enableFee', flex: 1, renderer: function (value) {
                return value ? "是" : "否"
            }},
            {header: '登录名', dataIndex: 'loginName', flex: 1, renderer: function (value) {
                var url = "http://" + window.channelHost + "/xy85abe/activate?name=" + value;
                //return url;
                return '<a target="_blank" href="' + url + '">' + value + "</a>";
                //return "<a href='http://"+window.channelHost+"/xy85abe/activate?name="+value+"'>"+name+"</a>";
            }},
            {header: '登录密码', dataIndex: 'loginPassword', flex: 1},
            {header: '新增用户数', dataIndex: 'newClientCount', flex: 1},
            {header: '重新激活用户数', dataIndex: 'reActivateCount', flex: 1},
            {header: '扣量百分比', dataIndex: 'discountRate', flex: 1},
            {header: '只计系统应用', dataIndex: 'onlySystemApp', flex: 1, renderer: function (value) {
                return value ? "是" : "否"
            }},

            {header: '前N个不计费', dataIndex: 'topFreeCount', flex: 1},
            {header: '业务延迟(秒)', dataIndex: 'delayChargeSeconds', flex: 1},
            {header: '用户日限', dataIndex: 'clientDailyMoney', flex: 1},
            {header: '用户月限', dataIndex: 'clientMonthlyMoney', flex: 1}
        ];
        return getColumns(this, columns);
    },
    getFormItems: function () {
        var modulePrefix = this.name + "-";
        return getFormItems(this, [
            {id: modulePrefix + 'uuid', xtype: 'hidden', name: 'uuid'},
            {id: modulePrefix + 'name', name: 'name', fieldLabel: '名称', allowBlank: false },
            {id: modulePrefix + 'loginName', name: 'loginName', fieldLabel: '登录名', allowBlank: false },
            {id: modulePrefix + 'loginPassword', name: 'loginPassword', fieldLabel: '登录密码', allowBlank: false },
            {id: modulePrefix + 'discountRate', name: 'discountRate', fieldLabel: '扣量百分比', allowBlank: false, xtype: 'numberfield', value: 20 },
            {id: modulePrefix + 'onlySystemApp', name: 'onlySystemApp', fieldLabel: '只计系统应用', xtype: 'checkbox', allowBlank: true, inputValue: 'true'},
            {id: modulePrefix + 'enableFee', name: 'enableFee', fieldLabel: '是否开启计费', xtype: 'checkbox', allowBlank: true, inputValue: 'true'},
            {id: modulePrefix + 'topFreeCount', name: 'topFreeCount', fieldLabel: '前N个不计费', allowBlank: false, xtype: 'numberfield', value: 0 },
            {id: modulePrefix + 'delayChargeSeconds', name: 'delayChargeSeconds', fieldLabel: '业务延迟(秒)', allowBlank: false, xtype: 'numberfield', value: 0 },
            {id: modulePrefix + 'clientDailyMoney', name: 'clientDailyMoney', fieldLabel: '用户日限', allowBlank: false, xtype: 'numberfield', value: 0 },
            {id: modulePrefix + 'clientMonthlyMoney', name: 'clientMonthlyMoney', fieldLabel: '用户月限', allowBlank: false, xtype: 'numberfield', value: 0 }
        ]);
    },
    copy: function (id) {
        this.showForm(id, true);
    },
    showForm: function (id, isCopyAction) {
    	var module = this;
    	module.isCopyAction = isCopyAction;
        window.bizObj = null;
        var modulePrefix = this.name + "-";
        window.businessId = id;
        showForm(module, 700, 410, id, function (obj) {
            window.bizObj = obj;
            Ext.each(['uuid', "name", "loginName", "loginPassword", "discountRate", "onlySystemApp","enableFee", "topFreeCount", "delayChargeSeconds","clientDailyMoney","clientMonthlyMoney"], function (item) {
                Ext.getCmp(modulePrefix + item).setValue(obj[item]);
            });
        });
    }
};


 
