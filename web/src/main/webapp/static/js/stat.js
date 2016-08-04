var getStatColumns=function(){
	var statColumns=[];
	statColumns.push({header: '指令数', dataIndex: 'stat', flex: 1, 
		renderer: function (stat) {
		    if (stat) {
		        return stat['orderCount'] + "";
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
	            }
	        }
	        if (orderCount > 0) return orderCount + "条";
	    }
	});
	/*statColumns.push({header: '信息费', dataIndex: 'stat', flex: 1, 
		renderer: function (stat) {
		    if (stat) {
		        return (stat['orderMoney'] / 100.0).toFixed(2);
		    }
		    return null;
		},
		summaryType: function (records) {
	        var orderMoney = 0;
	        for (var i = 0; i < records.length; i++) {
	            var stat = records[i].data['stat'];
	            if (stat) {
	                orderMoney += stat['orderMoney'];
	            }
	        }
	        if (orderMoney > 0) return  (orderMoney / 100.0).toFixed(0) + "元";
	    }
	});	*/
	statColumns.push({header: '成功数', dataIndex: 'stat', flex: 1, 
		renderer: function (stat) {
		    if (stat) {
		        return stat['successOrderCount'] + "";
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
	                orderCount += data['stat']['successOrderCount'];
	            }
	        }
	        if (orderCount > 0) return orderCount + "条";
	    }
	});	
	
	/*statColumns.push({header: '成功信息费', dataIndex: 'stat', flex: 1, 
		renderer: function (stat) {
		    if (stat) {
		        return (stat['successOrderMoney'] / 100.0).toFixed(2);
		    }
		    return null;
		},
		summaryType: function (records) {
	        var orderMoney = 0;
	        for (var i = 0; i < records.length; i++) {
	            var stat = records[i].data['stat'];
	            if (stat) {
	                orderMoney += stat['successOrderMoney'];
	            }
	        }
	        if (orderMoney > 0) return  (orderMoney / 100.0).toFixed(0) + "元";
	    }
	});		*/
	/*statColumns.push({header: '分成', dataIndex: 'stat', flex: 1, 
		renderer: function (stat) {
		    if (stat) {
		        return (stat['orderSharing'] / 100.0).toFixed(2);
		    }
		    return null;
		},
	    summaryType: function (records) {
	        var orderSharing = 0;
	        for (var i = 0; i < records.length; i++) {
	            var stat = records[i].data['stat'];
	            if (stat) {
	                orderSharing += stat['orderSharing'];
	            }
	        }
	        if (orderSharing > 0) return  (orderSharing / 100.0).toFixed(0) + "元";
	    }
	    }
	);	*/
	if(window.enableSync){
		statColumns.push({header: '同步数', dataIndex: 'stat', flex: 1, 
			renderer: function (stat) {
		        if (stat) return stat['syncCount'];
		    }
		 });
	}
	if(window.enableSync){
		statColumns.push({header: '同步收益', dataIndex: 'stat',flex:1,
	        renderer: function (stat) { return stat?(stat['syncSharing'] / 100.0).toFixed(2):null; },
	        summaryType: function (records) {
	            var syncMoney = 0;
	            for (var i = 0; i < records.length; i++) {
	                var stat = records[i].data['stat'];
	                if (stat) {
	                    syncMoney += stat['syncSharing'];
	                }
	            }
	            return (syncMoney / 100.0).toFixed(2) + "元";
	        }
	    });
	}
	if(window.enableSync){
		statColumns.push({header: '转化率', dataIndex: 'stat', flex: 1, 
			renderer: function (stat) {
		        if (stat) {
		            var syncCount = stat['syncCount'];
		            var orderCount = stat['successOrderCount'];
		            if (syncCount > 0 && orderCount > 0) {
		                return (syncCount * 100.0 / orderCount).toFixed(2) + "%"
		            }
		        }
		        return null;
		    }
	    });
	}
	return statColumns;
};