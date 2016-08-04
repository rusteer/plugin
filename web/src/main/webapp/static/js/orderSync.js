var orderSync = {
    serverUrl: window.context + '/rest/orderSync',
    displayName: "同步",
    name: "orderSync",
    showEditFormFlag: false,
    sorters: [
        {property: 'syncDate', direction: 'desc'}
    ],
    showId: false,
    showStatus: false,
    save: function () {
        var module = this;
        if (window.fp.getForm().isValid()) {
            Ext.Ajax.request({ url: window.context + '/ordersync/save/', method: "POST", waitMsg: "Please wait while saving", waitTitle: "Please wait", params: window.fp.getForm().getValues(),
                success: function (response) {
                    parseJson(response);
                    win.close();
                    module.refresh();
                },
                failure: function () {
                    alert("Save Failed");
                }
            });
        }
    },
    getGrid: function () {
        var module = this;
        var grid = getGrid(this);
        Ext.each(["from", 'to', "FilterByProvince", "FilterByBiz"], function (item) {
            Ext.getCmp(module.name + "-" + item).on('change', function () {
                module.refresh();
            });
        });
        return grid;
    },
    remove: function (id) {
        remove(this, id);
    },
    getDockItems: function () {
        var toDate = Ext.util.Format.date(new Date(), 'Y-m-d');
        var fromDate = Ext.util.Format.date(Ext.Date.add(new Date(), Ext.Date.DAY, -19), 'Y-m-d');
        var module = this;
        var modulePrefix = module.name + "-";
        return [
            "选择业务:",
            {id: modulePrefix + 'FilterByBiz', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [
                {property: 'status', direction: 'desc'}
            ], fields: ['id', 'name', 'status']})},
            "-",
            "选择省份:",
            {id: modulePrefix + 'FilterByProvince', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name', 'status']})},
            "-",
            "选择日期:",
            {format: 'Y-m-d', id: modulePrefix + 'from', xtype: 'datefield', value: fromDate},
            {format: 'Y-m-d', id: modulePrefix + 'to', xtype: 'datefield', value: toDate},
            "-"
        ];
    },
    getList: function (callBack) {
        var module = this;
        var url = module.serverUrl;
        var bizCmp = Ext.getCmp(module.name + "-FilterByBiz");
        if (bizCmp.value) {
            var fromValue = Ext.util.Format.date(Ext.getCmp(module.name + "-from").value, "Y-m-d");
            var toValue = Ext.util.Format.date(Ext.getCmp(module.name + "-to").value, "Y-m-d");
            var provinceId = Ext.getCmp(module.name + "-FilterByProvince").value
            Ext.Ajax.request({url: window.context + '/ordersync/allcount/', method: "GET", params: {bizId: bizCmp.value, from: fromValue, to: toValue, provinceId: provinceId}, success: function (response) {
                callBack(parseJson(response));
            }});
        } else {
            callBack({});
        }
    },
    refresh: function () {
        var module = this;
        var f1 = function () {
            refresh(module, function () {
            });
        }
        province.getList(function (provinceList) {
            var provinceStore = Ext.getCmp(module.name + "-FilterByProvince").getStore();
            provinceStore.loadData(provinceList);
            provinceStore.filterBy(province.isValidProvince);
            //provinceStore.filterBy(province.filter);
            biz.getList(function (bizList) {
                var bizCmp = Ext.getCmp(module.name + "-FilterByBiz");
                var store = bizCmp.getStore()
                store.loadData(bizList);
                store.filterBy(function (record) {
                    return  record.get("price") > 0; //&& record.get("syncMethod")==1;
                });
                if (store.getCount() > 0 && !bizCmp.value) {
                    var recordSelected = store.getAt(0);
                    bizCmp.setValue(recordSelected.get('id'));
                }
                f1();
            });
        });
    },
    getColumns: function () {
        var module = this;
        return getColumns(this, [
            {header: '日期', dataIndex: 'syncDate', flex: 1, summaryType: 'count',
                renderer: function (value, meta, record) {
                    return "<a href=\"javascript:" + module.name + ".showForm(" + record.get('id') + "," + record.get('syncCount') + ",'" + record.get('syncDate') + "')\">" + value + "</a>";
                },
                summaryRenderer: function (value, summaryData, dataIndex) {
                    return value + "天";
                }
            },
            {header: '总数', dataIndex: "syncCount", flex: 1, summaryType: 'sum',
                summaryRenderer: function (value, summaryData, dataIndex) {
                    return "" + value + "条";
                }}
        ]);
    },
    getFormItems: function () {
        var module = this;
        var modulePrefix = this.name + "-";
        var bizCmp = Ext.getCmp(module.name + "-FilterByBiz");
        var bizRecord = bizCmp.findRecord(bizCmp.valueField, bizCmp.getValue());
        var provinceCmp = Ext.getCmp(module.name + "-FilterByProvince");
        var provinceRecord = provinceCmp.findRecord(provinceCmp.valueField, provinceCmp.getValue());
        var provinceName = provinceRecord ? provinceRecord.get("name") : "全国";
        var provinceId = provinceRecord ? provinceRecord.get("id") : 0;
        return getFormItems(this, [
            {fieldLabel: '业务名称', value: bizRecord.get("name"), xtype: 'displayfield'},
            {fieldLabel: '区域名称', value: provinceName, xtype: 'displayfield'},
            {fieldLabel: '同步日期', value: module.syncDate, xtype: 'displayfield'},
            {id: modulePrefix + 'syncCount', name: 'syncCount', fieldLabel: '同步个数', allowBlank: false, value: module.syncCount},
            {xtype: 'hidden', name: 'bizId', value: bizRecord.get("id")},
            {xtype: 'hidden', name: 'syncDate', value: module.syncDate},
            {xtype: 'hidden', name: 'provinceId', value: provinceId}
        ]);
    },
    showForm: function (bizId, syncCount, syncDate) {
        var module = this;
        module.appId = bizId,
            module.syncDate = syncDate;
        module.syncCount = syncCount;
        var modulePrefix = module.name + "-";
        showForm(this, window.formWidth, 200, 0, function (obj) {
        });
    }
};


 
