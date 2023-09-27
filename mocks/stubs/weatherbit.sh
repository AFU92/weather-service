curl -v -X PUT "http://localhost:1080/mockserver/expectation" -d '{
    "httpRequest": {
        "method": "GET",
        "path": "/v2.0/current"
    },
    "httpResponse": {
        "statusCode": 200,
        "body": {
            "count": "1",
            "data": [{
                "temp": 13.85,
                "app_temp": 14.85
            }]
        },
        "delay": {
            "timeUnit": "MILLISECONDS",
            "value": 500
        }
    }
}'