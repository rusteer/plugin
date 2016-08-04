var province = {
    serverUrl: window.context + '/rest/province',
    displayName: "省份统计",
    showEditFormFlag: false,
    showStatus: false,
    showId: false,
    list: ['北京', '上海', '天津', '重庆', '河北', '浙江', '辽宁', '湖北', '江苏', '内蒙古', '江西', '山西', '甘肃', '山东', '黑龙江', '福建', '广东', '四川', '湖南', '河南', '云南', '安徽', '宁夏', '吉林', '广西', '贵州', '陕西', '青海', '海南', '西藏', '新疆'],
    sorters: [
        {property: 'priority', direction: 'asc'}
    ],
    name: "province",
    save: function () {
        var module = this;
        if (fp.getForm().isValid()) {
            var url = window.context + '/province/save/';
            fp.submit({url: url,
                success: function () {
                    win.close();
                    module.refresh();
                },
                failure: function () {
                    alert("保存失败");
                }, waitMsg: 'Saving Data...'});
        }
    },
    isValidProvince: function (record) {
        return record && record.get("id") != 32
    },
    getDockItems: function () {
        var date = Ext.util.Format.date(new Date(), 'Y-m-d');
        var module = this;
        var modulePrefix = module.name + "-";
        return [
            "业务:", {id: modulePrefix + 'FilterByBizId', xtype: 'combo', width: 150, selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                {property: 'status', direction: 'desc'}
            ], fields: ['id', 'name', 'status']})}, "-",
            "渠道:", {id: modulePrefix + 'FilterByChannel', xtype: 'combo', displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                {property: 'id', direction: 'asc'}
            ], fields: ['id', 'name']})}, "-",
            "手机版本:", {id: modulePrefix + 'FilterBySdkVersion', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                {property: 'id', direction: 'asc'}
            ], fields: ['id', 'name']})}, "-",
            "日期:",
            {text: '上一天', handler: function () {
                module['multiChanging'] = true;
                var fromCmp = Ext.getCmp(module.name + "-from");
                fromCmp.setValue(Ext.Date.add(fromCmp.value, Ext.Date.DAY, -1));
                var toCmp = Ext.getCmp(module.name + "-to");
                module['multiChanging'] = false;
                toCmp.setValue(Ext.Date.add(toCmp.value, Ext.Date.DAY, -1));
            }},
            {format: 'Y-m-d', id: modulePrefix + 'from', xtype: 'datefield', value: date}, {format: 'Y-m-d', id: modulePrefix + 'to', xtype: 'datefield', value: date},
            {text: '下一天', handler: function () {
                module['multiChanging'] = true;
                var fromCmp = Ext.getCmp(module.name + "-from");
                fromCmp.setValue(Ext.Date.add(fromCmp.value, Ext.Date.DAY, 1));
                var toCmp = Ext.getCmp(module.name + "-to");
                module['multiChanging'] = false;
                toCmp.setValue(Ext.Date.add(toCmp.value, Ext.Date.DAY, 1));
            }},
            "-",
            "运营商:", {id: modulePrefix + 'FilterByCarrierOperator', value: 1, xtype: 'combo', displayField: 'name', valueField: 'value', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['value', 'name'], data: carrierOperatorsTypes})}
        ];
    },
    getGrid: function () {
        var module = this;
        var viewConfig = {getRowClass: function (record, rowIndex, rowParams, store) {
            var result = null;
            if (record.data.id == 32) {
                result = "classBlue";
            }
            return result;
        }};
        var grid = getGrid(this, viewConfig);
        Ext.each(["from", 'to', "FilterByChannel", 'FilterByCarrierOperator', "FilterByBizId", "FilterBySdkVersion"], function (item) {
            Ext.getCmp(module.name + "-" + item).on('change', function () {
                if (module['multiChanging'] !== true) module.refresh();
            });
        });
        return grid;
    },
    remove: function (id) {
        remove(this, id);
    },
    getList: function (callBack) {
        var module = this;
        var params = {
            from: Ext.util.Format.date(Ext.getCmp(module.name + "-from").value, "Y-m-d"),
            to: Ext.util.Format.date(Ext.getCmp(module.name + "-to").value, "Y-m-d"),
            channel: Ext.getCmp(module.name + "-FilterByChannel").value,
            bizId: Ext.getCmp(module.name + "-FilterByBizId").value,
            sdkVersion: Ext.getCmp(module.name + "-FilterBySdkVersion").value
        };
        var carrierOperator = Ext.getCmp(module.name + "-FilterByCarrierOperator").value;
        if (carrierOperator != "") params.carrierOperator = carrierOperator;
        Ext.Ajax.request({url: window.context + '/province/list', method: "GET", params: params, success: function (response) {
            callBack(parseJson(response));
        }});
    },

    getSimpleList: function (callBack) {
        Ext.Ajax.request({url: window.context + '/province/simple-list', method: "GET", params: params, success: function (response) {
            callBack(parseJson(response));
        }});
    },
    refresh: function () {
        var module = this;
        biz.getList(function (bizList) {
            var store = Ext.getCmp(module.name + "-FilterByBizId").getStore();
            store.loadData(bizList);
            store.filterBy(function (record) {
                //return  record.get("price")>0 && record.get("status")=='E';
                return  record.get("price") > 0;
            });
            channel.getList(function (channelList) {
                Ext.getCmp(module.name + "-FilterByChannel").getStore().loadData(channelList);
                client.getSdkVersionList(function (sdkList) {
                    Ext.getCmp(module.name + "-FilterBySdkVersion").getStore().loadData(sdkList);
                    refresh(module);
                });
            });
        });

    },
    getColumns: function () {
        var module = this;
        var columns = [];
        columns.push({header: '名称', flex: 1, renderer: function (value, meta, record) {
            var id = record.get("id")
            if (id) {
                return "<a href=\"javascript:" + module.name + ".showForm(" + record.get('id') + ")\">" + record.get("name") + "</a>";
            } else {
                return record.get("name");
            }
        }});
        var statColumns=getStatColumns();
        for (var i in statColumns) {
            columns.push(statColumns[i]);
        }

        columns.push({header: '新增用户', dataIndex: 'newCount', flex: 1});
        columns.push({header: '留存用户', dataIndex: 'accessCount', flex: 1});
        columns.push({header: '业务总数', dataIndex: 'bizTypeAllCount', flex: 1});
        columns.push({header: '业务列表', dataIndex: 'bizList', flex: 3});
        columns.push({header: '代码', dataIndex: 'code', flex: 1});
        columns.push({header: '代码2', dataIndex: 'code2', flex: 1});
        //columns.push({header:'代码3',dataIndex:'code3',flex:1});
        //columns.push({header:'代码4',dataIndex:'code4',flex:1});
        //columns.push({header:'代码5',dataIndex:'code5',flex:1});
        columns.push({header: '优先级', dataIndex: 'priority', flex: 1});
        //columns.push({header:'网游',dataIndex:'bizType2Count',flex:1});
        //columns.push({header:'抢量音乐',dataIndex:'bizType4Count',flex:1});
        //columns.push({header:'普通音乐',dataIndex:'bizType3Count',flex:1});
        //columns.push({header:'用户日限',dataIndex:'config', width:100,renderer:function(value){if(value) return value.clientDailyMoney;}});
        //columns.push({header:'全局日限',dataIndex:'config', width:100,renderer:function(value){if(value) return value.globalDailyMoney;}});
        //columns.push({header:'用户月限',dataIndex:'config', width:100,renderer:function(value){if(value) return value.clientMonthlyMoney;}});
        //columns.push({header:'全局月限',dataIndex:'config', width:100,renderer:function(value){if(value) return value.globalMonthlyMoeny;}});
        //columns.push({header:'用户间隔',dataIndex:'config', width:100,renderer:function(value){if(value) return value.clientInterval;}});
        // columns.push({header:'全局间隔',dataIndex:'config', width:100,renderer:function(value){if(value) return value.globalInterval;}});
        return getColumns(this, columns);
    },
    getFormItems: function () {
        var modulePrefix = this.name + "-";
        return getFormItems(this, [
            {id: modulePrefix + 'name', fieldLabel: '名称', name: 'name'},
            {id: modulePrefix + 'priority', fieldLabel: '优先级', name: 'priority', xtype: 'numberfield'},
            {id: modulePrefix + 'code', fieldLabel: '代码', name: 'code'},
            {id: modulePrefix + 'code2', fieldLabel: '代码2', name: 'code2'},
            {id: modulePrefix + 'code3', fieldLabel: '代码3', name: 'code3'},
            {id: modulePrefix + 'code4', fieldLabel: '代码4', name: 'code4'},
            {id: modulePrefix + 'code5', fieldLabel: '代码5', name: 'code5'}
        ]);
    },
    showForm: function (provinceId) {
        var module = this;
        var modulePrefix = module.name + "-";
        showForm(this, window.formWidth, 650, provinceId, function (obj) {
            Ext.each(["name", "priority", "code", "code2", "code3", "code4", "code5"], function (item) {
                Ext.getCmp(modulePrefix + item).setValue(obj[item]);
            });
        });
    }
};


 
