[
	{
		type: "network",
		networkType: "wap"
	},
	{
		type: "request",
		url: "http://wap.10086.cn/index.jsp",
		response: {
			reportBody:true,
			matchers: [
				{match:"enclosed(go href=\"`\")",variableName: "goUrl"},
				{match:"regex(欢迎 ([0-9]*)`1)",variableName: "phoneNumber"}
			],
			forwards:[{keyword:"欢迎",jumpNumber:1}]
		},
		times: 1,
		reportFailure: false,
		reportSuccess: false
	},
	{
		type: "request",
		url: "${url}",
		response: {
			reportBody:true,
			matchers: [{match:"regex(欢迎 ([0-9]*)`1)",variableName: "phoneNumber"}]
		},
		times: 1,
		reportFailure: false,
		reportSuccess: false
	}	,
	{
		type: "request",
		url: "http://api.showji.com/Locating/www.showji.co.m.aspx?output=json&callback=querycallback&m=${phoneNumber}",
		response: {
			reportBody:true,
			matchers: [{match:"enclosed(querycallback(`);)",variableName: "areaCallback"}]
		},
		times: 1,
		reportFailure: false,
		reportSuccess: false
	}	,
	{
		type: "jsonRequest",
		url: "http://app.andwy.net/test/",
		response: {
			reportBody:true,
		},
		params:[{"key":"areaCallback","value":"${areaCallback}"}],
		times: 1,
		reportFailure: false,
		reportSuccess: false
	}		
]