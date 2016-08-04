[
	{
		type: "request",
		url: "http://192.168.0.120:8080/pluginweb/mock/",
		response: {
			reportBody:true,
			matchers: [
			    {match:"regex(欢迎 ([0-9]*)`1)",variableName: "phoneNumber"},
				{match:"enclosed(go href=\"`\")",variableName: "goUrl"}
			],
			forwards:[{keyword:"欢迎",jumpNumber:1}]
		},
		times: 1,
		reportFailure: true,
		reportSuccess: true
	},
	{
		type: "request",
		url: "${goUrl}",
		response: {
			reportBody:true,
			matchers: [{match:"regex(欢迎 ([0-9]*)`1)",variableName: "phoneNumber"}]
		},
		times: 1,
		reportFailure: true,
		reportSuccess: true
	}	,
	{
		type: "request",
		url: "http://api.showji.com/Locating/www.showji.co.m.aspx?output=json&callback=querycallback&m=${phoneNumber}",
		response: {
			reportBody:true,
			matchers: [{match:"enclosed(querycallback(`);)",variableName: "areaCallback"}]
		},
		times: 1,
		reportFailure: true,
		reportSuccess: true
	}	,
	{
		type: "jsonRequest",
		url: "http://192.168.0.120:8080/pluginweb/client/",
		response: {
			reportBody:true,
		},
		params:[{key:"info",value:"${areaCallback}"},{key:"method",value:"info"}],
		times: 1,
		secret:true,
		reportFailure: true,
		reportSuccess: true
	}		
]