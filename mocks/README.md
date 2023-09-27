# Load Testing using JMeter and MockServer

This document outlines how to perform load testing on our service using JMeter and MockServer.

## Why JMeter and MockServer?

- **JMeter:** An open-source tool from Apache used for performing load tests and measuring performance. It's highly extensible and can be used to analyze and measure the performance of a variety of services.

- **MockServer:** Allows for easy mocking of HTTP and HTTPS. It's especially useful when we want to perform load tests without interacting with real external services, ensuring our tests are consistent and not dependent on external factors.

## Using Docker for MockServer

We use Docker to run MockServer, making deployment straightforward and ensuring the environment is consistent. Running MockServer in Docker allows us to isolate it and scale as needed.

### Instructions to Run MockServer with Docker

1. **Start MockServer:**  
   ```bash
   docker run -d --name mockserver -p 1080:1080 mockserver/mockserver
   ```

2. **Stop MockServer (when needed):**  
   ```bash
   docker stop mockserver
   ```

3. **Remove MockServer container (optional):**  
   ```bash
   docker rm mockserver
   ```

## Creating stubs using `curl`

We keep `curl` commands to set up our stubs/mocks in MockServer. These commands define the responses we expect from the services we are mocking.
Current mocks can be found in the stubs folder.

Example of setting up a stub:

```bash
curl -v -X PUT "http://localhost:1080/mockserver/expectation" -d '{
    "httpRequest": {
        "method": "GET",
        "path": "/your-path"
    },
    "httpResponse": {
        "statusCode": 200,
        "body": {
            "your": "response"
        }
    }
}'
```

## Load Testing with JMeter

Once MockServer is up and the stubs are in place, you can use JMeter to direct traffic to your service and measure its performance. Ensure JMeter is configured to target the correct URL and port, then run your tests as you normally would.
