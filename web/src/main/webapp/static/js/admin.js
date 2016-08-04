String.prototype.trim = function() {
    return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
  }

var carrierOperatorsTypes = [
    {name: "未知", value: 0},
    {name: "移动", value: 1},
    {name: "联通", value: 2},
    {name: "电信", value: 3}
];
var clientSataTypes = [
    {id: 0, name: "新增用户"},
    {id: 1, name: "留存用户"}
];

var entityStatusList = ['Y', 'N'];
window.formWidth = 720;

var bizTypes = [
    {id: 1, name: "短信"},
    {id: 2, name: "网游"},
    {id: 3, name: "普通音乐"},
    {id: 4, name: "抢量音乐"},
    {id: 5, name: "小额支付"}
];

var getWidth = function () {
    var width = window.screen.width - 45;
    if (width < 1200) width = 1200;
    return width;
};
window.windowWidth = getWidth();

Ext.tip.QuickTipManager.init();
var groupFeature = {id: 'group', ftype: 'groupingsummary', groupHeaderTpl: '{status}', hideGroupedHeader: false, enableGroupingMenu: true};
var activeHanlder = function (tab) {
    document.getElementById("tabId").value = tab.id;
};
var loadData = function (cmpId) {
    try {
        if (win) win.close();
    } catch (err) {
    }
    if (!window.moduleLoad) window.moduleLoad = {};
    if (!window.moduleLoad[cmpId]) {
        eval(cmpId + ".refresh();");
        window.moduleLoad[cmpId] = true;
    }
};

var parseJson = function (response) {
    var content = response.responseText;
    if (content.indexOf("登录页") > 0) {
        window.location.reload();
        return;
    }
    if (content.length > 0) {
        return Ext.decode(content);
    }
    return null;
}

var getList = function (module, callBack) {
    var url = module.serverUrl;
    if (module.composeListParameters) {
        url = url + "?" + module.composeListParameters();
    }
    Ext.Ajax.request({url: url, method: "GET", success: function (response) {
        var obj = null;
        try {
            obj = parseJson(response);
        } catch (err) {
            window.location.reload();
        }
        callBack(obj);
    }});
};

var remove = function (module, id) {
    var serverUrl = module.serverUrl + "/" + id;
    Ext.MessageBox.confirm('警告', '确认要删除吗?', function (btn) {
        if ("yes" == btn) {
            Ext.Ajax.request({ url: serverUrl, method: "DELETE", success: function (response) {
                parseJson(response);
                module.refresh();
            }
            });
        }
    });
};

var getGrid = function (module, moduleViewConfig) {
    var modelFields = [
        {name: 'id', mapping: 'id', type: "int"}
    ];
    if (module.modelFields) {
        for (var i = 0; i < module.modelFields.length; i++) {
            modelFields.push(module.modelFields[i]);
        }
    }
    var sorters = [];
    sorters.push({property: 'status', direction: 'desc'});
    if (module.sorters) {
        for (var i = 0; i < module.sorters.length; i++) {
            sorters.push(module.sorters[i]);
        }
    }

    sorters.push({property: 'id', direction: 'asc'});
    var store = Ext.create('Ext.data.Store', { model: Ext.define('Task', {extend: 'Ext.data.Model', idProperty: 'id', fields: modelFields}), sorters: sorters, groupField: 'status'});

    var toolbars = null;
    if (module.getToolbars) {
        toolbars = module.getToolbars();
    } else {
        var dockList = ["-", {text: '刷新', handler: function () {
            module.refresh();
        }}, "-"];
        if (!(module.showEditFormFlag === false)) {
            dockList.push({text: '添加' + module.displayName, handler: function () {
                module.showForm(0)
            }});
            dockList.push("-");
        }
        if (module.getDockItems) {
            var items = module.getDockItems();
            for (var i in items) {
                dockList.push(items[i]);
            }
        }
        toolbars = [
            { dock: 'top', xtype: 'toolbar', items: dockList}
        ];
    }
    var gridProp = {
        id: module.name,
        dockedItems: toolbars,
        width: '100%',
        frame: true,
        //columnLines:true,
        title: module.displayName,
        iconCls: 'icon-grid',
        store: store,
        listeners: {
            activate: activeHanlder,
            rowcontextmenu: function (grid, index, event) {
                alert(1);
            }
        },
        //viewConfig: viewConfig,
        features: [groupFeature],
        selModel: Ext.create('Ext.selection.Model', { listeners: {} }),
        columns: module.getColumns()
    };
    if (moduleViewConfig) gridProp.viewConfig = moduleViewConfig;
    return Ext.create('Ext.grid.Panel', gridProp);
};

var getColumns = function (module, columns) {
    var result = [];
    if (module.showId != false) {
        result.push({text: 'ID', dataIndex: 'id', width: 50,
            summaryType: 'count',
            summaryRenderer: function (value, summaryData, dataIndex) {
                return value + "个";
            },
            renderer: function (value, metaData, record) {
                return "<a href=\"javascript:" + module.name + ".showForm(" + record.get('id') + ")\">" + value + "</a>";
            }
        });
    }
    for (var i in columns) {
        result.push(columns[i]);
    }
    if (window.isSuper)  result.push({header: '操作', width: 50, sortable: false, dataIndex: 'actions', renderer: function (value, metaData, record) {
        return "<a href=\"javascript:" + module.name + ".remove(" + record.get('id') + ")\">删除</a>";
    }});
    if (module.showStatus != false) {
        result.push({header: '状态', dataIndex: 'status', width: 80, renderer: function (value) {
            return "E" == value ? "开启" : "关闭";
        }});
    }
    return {items: result, defaults: {sortable: true, align: "left"}};
};

var getFormItems = function (module, items) {
    var result = [];
    for (var i in items) {
        result.push(items[i]);
    }
    var modulePrefix = module.name + "-";
    result.push({id: modulePrefix + 'id', xtype: 'hidden', name: 'id'});
    if (module.showStatus != false) {
        result.push({id: modulePrefix + 'status', name: 'status', fieldLabel: '状态', xtype: 'checkbox', allowBlank: true, inputValue: 'E', checked: true});
    }
    return [
        { xtype: 'container', layout: 'fit', margin: '0 0 10', items: {xtype: 'fieldset', flex: 1, defaultType: 'textfield', layout: 'column', defaults: {anchor: '100%', hideEmptyLabel: true}, items: result }}
    ];
    //return [{ xtype : 'fieldset', layout : 'fit', margin : '0 0 10', items :result}];
};

var refresh = function (module, callBack) {
    var loading = new Ext.LoadMask(Ext.get(Ext.getBody()), {msg: 'Loading...', removeMask: true});
    loading.show();
    module.getList(function (list) {
        Ext.getCmp(module.name).getStore().loadData(list);
        loading.hide();
        if (callBack) callBack();
    });
};


var save = function (module, postData) {
    if (window.fp.getForm().isValid()) {
        var data = postData ? postData : window.fp.getForm().getValues();
        var obj = {};
        for (var name in data) {
            if (name.indexOf('ext-gen') == 0) {
                continue;
            }
            obj[name] = data[name];
        }
        Ext.Ajax.request({url: obj.id > 0 ? (module.serverUrl + "/" + obj.id) : module.serverUrl, method: obj.id > 0 ? "PUT" : "POST", waitMsg: "Please wait while saving", waitTitle: "Please wait", headers: {'Content-Type': 'application/json'}, params: Ext.encode(obj),
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
};

var showForm = function (module, formWidth, formHeight, editId, getEntityDataCallBack, list1, list2, list3, list4, list5, list6, list7) {
    try {
        win.close();
    } catch (err) {
    }
    var buttons = [];
    if (module.showSaveButton != false) {
        buttons.push({ text: '保存', handler: function () {
            module.save();
        }});
    }
    window.fp = Ext.create('Ext.FormPanel', { border: false, height: "100%", buttons: buttons, frame: true, fieldDefaults: {labelWidth: 80, width: 650}, width: '100%', items: module.getFormItems(list1, list2, list3, list4, list5, list6, list7)});
    var titlePrefix= editId == 0  ? '添加,' : "更新,";
    if(module.isCopyAction){
    	titlePrefix="复制,"
    }
    window.win = Ext.create('Ext.window.Window', { title: titlePrefix + module.displayName, constrain: true, autoScroll: true, layout: 'fit', width: formWidth, height: formHeight, minWidth: formWidth, minHeight: formHeight, layout: 'fit', plain: true});
    window.win.show();
    win.add(fp);
    if (module.useMask) {
        fp.getEl().mask("Please wait...", "x-mask-loading");
    }
    if (module.afterFormLoaded) module.afterFormLoaded();
    if (editId > 0) {
        var url = module.serverUrl + '/' + editId
        Ext.Ajax.request({ url: url, method: "GET", success: function (res) {
            var obj = null;
            try {
                obj = parseJson(res);
            } catch (err) {
                window.location.reload();
            }
            var modulePrefix = module.name + "-";
            Ext.getCmp(modulePrefix + 'id').setValue(obj.id);
            if (module.showStatus !== false) {
                Ext.getCmp(modulePrefix + 'status').setValue(obj.status);
            }
            getEntityDataCallBack(obj);
        }});
    }
};

Ext.onReady(function () {
    window.loadingFinished = false;
    var tabId = document.getElementById("tabId").value;
    if (window.location.hash) {
        tabId = window.location.hash.substring(1);
    }
    Ext.History.init();
    window.tokenDelimiter = ':';
    window.tabPanel = Ext.createWidget('tabpanel', {tabPosition: 'top', width: window.windowWidth, renderTo: 'reportGrid', defaults: {bodyPadding: 10}, listeners: {tabchange: function (tabPanel, tab) {
        if (window.loadingFinished) {
            Ext.History.add(tab.id);
            loadData(tab.id);
        }
    }}});
    window.tabPanel.add(biz.getGrid());
    window.tabPanel.add(dateStat.getGrid());
    window.tabPanel.add(province.getGrid());
    window.tabPanel.add(channel.getGrid());
    if(window.isSuper) window.tabPanel.add(pkg.getGrid());
    if(window.enableSync) window.tabPanel.add(orderSync.getGrid());
    window.tabPanel.add(setting.getForm());
    window.tabPanel.add(log.getGrid());
    window.loadingFinished = true;
    if (!tabId) tabId = 'biz';
    window.tabPanel.setActiveTab(Ext.getCmp(tabId));
    loadData(tabId);
});