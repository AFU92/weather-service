# Weather Service

The `weather-service` project is a Rails-based application that provides weather information by utilizing the Weatherbit API. The service fetches current temperature data based on city and country parameters and renders the data in a JSON format.

## Features

- Fetch current temperature data based on city and country.
- Uses caching to efficiently serve repeated requests.
- Comprehensive error messages for invalid or missing parameters.

## Setup

### Requirements

- Ruby version: (Specify the version you're using, e.g., `3.2.2`)
- Rails version: (Specify the version you're using, e.g., `7.0.8`)
- Other dependencies: (List any other required packages or services, such as Redis if you're using it)

### Installation

1. Clone the repository:

   ```
   git clone git@github.com:AFU92/weather-service.git
   cd weather-service
   ```

2. Install the necessary gems:

   ```
   bundle install
   ```

3. Set up the environment variables:

   Create a .env file in the root directory of the project and set up your Weatherbit API configurations:

   ```
   WEATHERBIT_BASE_URL=[YOUR_WEATHERBIT_BASE_URL]
   WEATHERBIT_API_KEY=[YOUR_WEATHERBIT_API_KEY]
   ```
   Replace [YOUR_WEATHERBIT_BASE_URL] and [YOUR_WEATHERBIT_API_KEY] with your actual Weatherbit URL and API key respectively. 

4. Start the Rails server:

   ```
   rails s
   ```

## Usage

To fetch current weather data for a specific city and country:

```
GET /current?city=[CITY_NAME]&country=[COUNTRY_CODE]
```

Example:

```
GET /current?city=Raleigh&country=US
```

Response:

```json
{
  "temperature": 22.5,
  "apparent_temperature": 23.0
}
```

## Caching

The service uses Rails caching to store weather data for 10 minutes, reducing the need for repeated API calls and improving response times for frequently requested locations.


