var dateStat = {
    displayName: "日期",
    name: "dateStat",
    showEditFormFlag: false,
    showId: false,
    showStatus: false,
    save: function () {
        save(this);
    },
    getGrid: function () {
        var module = this;
        var grid = getGrid(this);
        Ext.each(["from", 'to', "FilterByProvince", "FilterByChannel", 'FilterByCarrierOperator', 'FilterByBizId', 'FilterBySdkVersion'], function (item) {
            Ext.getCmp(module.name + "-" + item).on('change', function () {
                module.refresh();
            });
        });
        return grid;
    },
    getDockItems: function () {
        var toDate = Ext.util.Format.date(new Date(), 'Y-m-d');
        var fromDate = Ext.util.Format.date(Ext.Date.add(new Date(), Ext.Date.DAY, -9), 'Y-m-d');
        var module = this;
        var modulePrefix = module.name + "-";
        return [
            "省份:", {id: modulePrefix + 'FilterByProvince', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['id', 'name', 'status']})}, "-",
            "业务:", {id: modulePrefix + 'FilterByBizId', xtype: 'combo', width: 150, selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [{property: 'status', direction: 'desc'}], fields: ['id', 'name', 'status']})}, "-",
            "渠道:", {id: modulePrefix + 'FilterByChannel', xtype: 'combo', displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [{property: 'id', direction: 'asc'} ], fields: ['id', 'name']})}, "-",
            "日期:", {format: 'Y-m-d', id: modulePrefix + 'from', xtype: 'datefield', value: fromDate}, {format: 'Y-m-d', id: modulePrefix + 'to', xtype: 'datefield', value: toDate}, "-",
            "手机版本:", {id: modulePrefix + 'FilterBySdkVersion', xtype: 'combo', selectOnFocus: true, lastQuery: "", displayField: 'name', valueField: 'id', queryMode: 'local', store: Ext.create('Ext.data.Store', {sorters: [{property: 'id', direction: 'asc'}], fields: ['id', 'name']})}, "-",
            "运营商:", {id: modulePrefix + 'FilterByCarrierOperator', xtype: 'combo', value: 1, displayField: 'name', valueField: 'value', queryMode: 'local', store: Ext.create('Ext.data.Store', {fields: ['name', 'value'], data: carrierOperatorsTypes})}
        ];
    },
    getList: function (callBack) {
        var module = this;
        var params = {
            from: Ext.util.Format.date(Ext.getCmp(module.name + "-from").value, "Y-m-d"),
            to: Ext.util.Format.date(Ext.getCmp(module.name + "-to").value, "Y-m-d"),
            channel: Ext.getCmp(module.name + "-FilterByChannel").value,
            provinceId: Ext.getCmp(module.name + "-FilterByProvince").value,
            bizId: Ext.getCmp(module.name + "-FilterByBizId").value,
            sdkVersion: Ext.getCmp(module.name + "-FilterBySdkVersion").getValue()
        };
        var carrierOperator = Ext.getCmp(module.name + "-FilterByCarrierOperator").value;
        console.log(carrierOperator);
        if (carrierOperator !== "") params.carrierOperator = carrierOperator;
        Ext.Ajax.request({url: window.context + '/stat/date/', method: "GET", params: params, success: function (res) {
            callBack(parseJson(res));
        }});
    },
    refresh: function () {
        var module = this;
        province.getList(function (provinceList) {
            var cmp = Ext.getCmp(module.name + "-FilterByProvince");
            var store = cmp.getStore();
            store.loadData(provinceList);
            store.filterBy(province.isValidProvince);
            biz.getList(function (bizList) {
                Ext.getCmp(module.name + "-FilterByBizId").getStore().loadData(bizList);
                channel.getList(function (channelList) {
                    Ext.getCmp(module.name + "-FilterByChannel").getStore().loadData(channelList);
                    client.getSdkVersionList(function (sdkList) {
                        Ext.getCmp(module.name + "-FilterBySdkVersion").getStore().loadData(sdkList);
                        refresh(module);
                    });
                });
            });
        });
    },
    getColumns: function () {
        var module = this;
        var columns = [
            {header: '日期', dataIndex: 'statDate', flex: 1, summaryType: 'count', summaryRenderer: function (value) {
                return value + "天";
            }}
        ];
        var statColumns=getStatColumns();
        for (var i in statColumns) {
            columns.push(statColumns[i]);
        }
        //columns.push( {header:'累积新增用户',dataIndex:"allCount",flex:1});
        columns.push({header: '留存用户数', dataIndex: "accessCount", flex: 1});
//         columns.push( {header:'累积留存率',flex:2, renderer:function(value,meta,record){
//            var createCount=record.get("allCount");
//            var leftCount=record.get("accessCount");
//            if(createCount)  {
//                if(!leftCount)  leftCount=0;
//                var toDate = Ext.util.Format.date(Ext.getCmp(module.name+"-to").getValue(), 'Y-m-d');
//                var statDate=Ext.util.Format.date(record.get('statDate'), 'Y-m-d');
//                var elapsed = Math.round(((new Date(toDate)).getTime() - (new Date(statDate)).getTime())/(3600*24*1000));
//                return elapsed+"天:"+(leftCount*100.0/createCount).toFixed(2)+"%";
//            }
//            }
//         });
        columns.push({header: '新增用户数', dataIndex: "dailyNewCount", flex: 1, summaryType: 'sum', summaryRenderer: function (value) {
            if (value > 0) return value + "个";
        }});
        columns.push({header: '重新激活用户数', dataIndex: "dailyReactivateCount", flex: 1, summaryType: function (records) {
            var result = 0;
            for (var i = 0; i < records.length; i++) {
                var count = records[i].data['dailyReactivateCount'];
                if (count) {
                    result += count;
                }
            }
            if (result > 0) return  result + "个";
        }});
        /*columns.push( {header:'日留存用户',dataIndex:"dailyAccessCount",flex:1});
         columns.push( {header:'日留存率',flex:2, renderer:function(value,meta,record){
         var createCount=record.get("dailyNewCount");
         var leftCount=record.get("dailyAccessCount");
         if(createCount)  {
         if(!leftCount)  leftCount=0;
         var toDate = Ext.util.Format.date(Ext.getCmp(module.name+"-to").getValue(), 'Y-m-d');
         var statDate=Ext.util.Format.date(record.get('statDate'), 'Y-m-d');
         var elapsed = Math.round(((new Date(toDate)).getTime() - (new Date(statDate)).getTime())/(3600*24*1000));
         return elapsed+"天:"+(leftCount*100.0/createCount).toFixed(2)+"%";
         }
         }
         });*/
        return getColumns(this, columns);
    }
};


 
