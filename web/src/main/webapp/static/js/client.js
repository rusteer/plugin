var client = {
    serverUrl: window.context + '/rest/client',
    displayName: "用户",
    name: "client",
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
    getGrid: function () {
        return getGrid(module, viewConfig);
    },
    remove: function (id) {
        remove(this, id);
    },
    getList: function (callBack) {
        getList(this, callBack);
    },
    getSdkVersionList: function (callBack) {
        var module = this;
        Ext.Ajax.request({url: module.serverUrl + "/sdkversionlist", method: "GET", success: function (response) {
            var list = parseJson(response);
            var result = [];
            for (var i in list) {
                var name = list[i];
                result.push({id: name, name: name});
            }
            callBack(result);
        }});
    },
    refresh: function () {
        var module = this;
        refresh(module, function () {
            //module.filterByProvince();
        });
    },
    getColumns: function () {
        var module = this;
        return getColumns(this, []);
    },

    getFormItems: function () {
        return getFormItems(this, []);
    },
    showForm: function (index) {
        var module = this;
        module.index = index
        showForm(this, 1024, 600, 0, function (obj) {
        });
    }
};


 
