var statColumns = [
    {header: '指令,反馈,同步数', dataIndex: 'stat', width: 150,
        renderer: function (stat) {
            if (stat) {
                return stat['orderCount'] + "," + stat['confirmCount'] + "," + stat['syncCount'];
            }
            return null;
        },
        summaryType: function (records) {
            var orderCount = 0;
            var confirmCount = 0;
            var syncCount = 0;
            for (var i = 0; i < records.length; i++) {
                var data = records[i].data;
                if (data['stat']) {
                    orderCount += data['stat']['orderCount'];
                    confirmCount += data['stat']['confirmCount'];
                    syncCount += data['stat']['syncCount'];
                }
            }
            return orderCount + "," + confirmCount + "," + syncCount;
        }
    },
    {header: '反馈,同步金额', dataIndex: 'stat', width: 150,
        renderer: function (stat) {
            if (stat) {
                return (stat['confirmSharing'] / 100.0).toFixed(2) + "," + (stat['syncSharing'] / 100.0).toFixed(2);
            }
            return null;
        },
        summaryType: function (records) {
            var confirmMoney = 0;
            var syncMoney = 0;
            for (var i = 0; i < records.length; i++) {
                var stat = records[i].data['stat'];
                if (stat) {
                    confirmMoney += stat['confirmSharing'];
                    syncMoney += stat['syncSharing'];
                }
            }
            return  (confirmMoney / 100.0).toFixed(2) + "," + (syncMoney / 100.0).toFixed(2) + "元";
        }
    },
    {header: '反馈率', width: 80,
        renderer: function (value, meta, record) {
            var stat = record.get('stat');
            if (stat) {
                var orderCount = stat['orderCount'];
                var confirmCount = stat['confirmCount'];
                if (orderCount) {
                    return (confirmCount * 100.0 / orderCount).toFixed(2) + "%,";
                }
            }
            return null;
        }
    },
    {header: '同步率', width: 80,
        renderer: function (value, meta, record) {
            var stat = record.get('stat');
            if (stat) {
                var orderCount = stat['orderCount'];
                var syncCount = stat['syncCount'];
                if (orderCount) {
                    return (syncCount * 100.0 / orderCount).toFixed(2) + "%";
                }
            }
            return null;
        }
    } ,
    {header: '同步反馈率', width: 80,
        renderer: function (value, meta, record) {
            var stat = record.get('stat');
            if (stat) {
                var confirmCount = stat['confirmCount'];
                var syncCount = stat['syncCount'];
                if (confirmCount) {
                    return (syncCount * 100.0 / confirmCount).toFixed(2) + "%";
                }
            }
            return null;
        }
    }
];