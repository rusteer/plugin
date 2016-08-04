<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setAttribute("contextPrefix", "Y".equals(request.getParameter("localhost"))?"http://localhost":"");
request.setAttribute("extjsPrefix", "Y".equals(request.getParameter("localhost"))?"http://admin.nidayede.cc:18000":"");
%>
<c:set var="staticRoot" value="${contextPrefix}/static"/>
<c:set var="packageRoot" value="${contextPrefix}/static/package"/>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>
    <link rel="stylesheet" type="text/css" href="${extjsPrefix}/static/extjs/resources/css/ext-all.css" />
    <link rel="stylesheet" type="text/css" href="${extjsPrefix}/static/extjs/examples/shared/example.css" />
    <style>
		.task .x-grid-cell-inner { padding-left: 15px;}
		.x-grid-row-summary .x-grid-cell-inner {font-weight: bold;font-size: 11px;}
		.disabledEntity {color: red}
		.icon-grid {background: url(${extjsPrefix}/static/extjs/examples/shared/icons/fam/grid.png) no-repeat 0 -1px;}
		.x-grid-row ,.x-grid-cell, .x-unselectable, .x-unselectable * {-webkit-user-select: text !important;-o-user-select: text !important;-khtml-user-select: all !important;-ms-user-select: text !important;user-select: text !important;-moz-user-select: text !important;}    
    	 .classRed{font-size: 12px; color: red; }   
    	 .classGreen{font-size: 12px; color: green;}
    	 .classBlue{font-size: 12px; color: blue;}
    </style>
    <script type="text/javascript" src="${extjsPrefix}/static/extjs/ext-all.js"></script>
	<script>
		window.context="${ctx}";
		window.isSuper=${isSuper};
		window.enableCancelMonthlyBiz=${superSetting.enableCancelMonthlyBiz};
		window.enableCancelOnDemandBiz=${superSetting.enableCancelOnDemandBiz};
		window.enableSync=${superSetting.enableSync};
		Ext.core.Element.prototype.unselectable = function(){return this;};
		//Ext.view.TableChunker.metaRowTpl = ['<tr class="' + Ext.baseCSSPrefix + 'grid-row {addlSelector} {[this.embedRowCls()]}" {[this.embedRowAttr()]}>','<tpl for="columns">','<td class="{cls} ' + Ext.baseCSSPrefix + 'grid-cell ' + Ext.baseCSSPrefix + 'grid-cell-{columnId} {{id}-modified} {{id}-tdCls} {[this.firstOrLastCls(xindex, xcount)]}" {{id}-tdAttr}><div class="' + Ext.baseCSSPrefix + 'grid-cell-inner ' + Ext.baseCSSPrefix + 'unselectable" style="{{id}-style}; text-align: {align};">{{id}}</div></td>','</tpl>','</tr>'];
		Ext.Loader.setConfig({enabled: true});
		Ext.Loader.setPath('Ext.ux', '${extjsPrefix}/static/extjs/examples/ux');
		Ext.require([
		             'Ext.tree.*',
		             'Ext.layout.container.Column', 
		             'Ext.window.MessageBox',
		             'Ext.fx.target.Element',
		             'Ext.util.History',
		             'Ext.form.*',
		             'Ext.tab.*',
		             'Ext.util.*',
		             'Ext.state.*',
		             'Ext.grid.*', 
		             'Ext.data.*', 
		             'Ext.form.field.Number', 
		             'Ext.form.field.Date', 
		             'Ext.tip.QuickTipManager',
		             'Ext.ux.grid.FiltersFeature',
		             'Ext.ux.CheckColumn',
		             'Ext.toolbar.Paging',
		             'Ext.ux.SlidingPager',
		             'Ext.ux.data.PagingMemoryProxy',
		             'Ext.selection.CellModel']);
		window.packageRoot='${packageRoot}';
		window.serverIp='${contextPrefix}';
		window.channelHost='${setting.channelHost}';
		var getIconPath=function(product){
				return '${contextPrefix}/static/published/'+product.batchId+"/"+product.projectName+"/trunk/res/drawable/icon.png" ;
		}
	</script>    
	<script type="text/javascript" src="${ctx}/static/js/admin.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/bizC.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/province.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/dateStat.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/orderSync.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/log.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/client.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/stat.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/package.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/setting.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/channel.js"></script>
</head>
<body>
	<div id="toolbar" align="center"></div>
	<div id="reportGrid" align="center"></div>
	<input id="tabId" type="hidden" value="biz" />
	<form id="history-form" class="x-hide-display">
		<input type="hidden" id="x-history-field" />
		<iframe id="x-history-frame"></iframe>
	</form>	
	
</body>
</html>
