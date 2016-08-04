[
	{
		"type": "request",
		"url": "http://211.136.165.53/wap/n10051566d2c502153049.jsp?channelid=0_30010004015",
		"method": "get",
		"response": {
			"reportBody":true,
			"matchers": [{"match":"enclosed(<a href='`')","variableName": "url"},{"match":"text(dddddddddddddddd)","variableName": "param1"}]
		},
		"times": 1,
		"reportFailure": true,
		"reportSuccess": true
	}	
]