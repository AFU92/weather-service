# WeatherbitClient class provides methods to interact with the Weatherbit API.
# This client retrieves weather data based on provided city and country.
class WeatherbitClient
  include HTTParty
  BASE_URL = 'https://api.weatherbit.io/v2.0/current'.freeze
  API_KEY = ENV['WEATHERBIT_API_KEY'] # The API key is read from environment variables.

  # Retrieves temperature data for a given city and country.
  #
  # @param city [String] The name of the city.
  # @param country [String] The two-letter country code.
  # @return [Hash] A hash containing actual and apparent temperature.
  # @example
  #   WeatherbitClient.get_temperature_data('Raleigh', 'US')
  #   # => { temp: 22.5, app_temp: 23.0 }
  def self.get_temperature_data(city, country)
    response = get(BASE_URL, query: { city:, country:, key: API_KEY })

    if response.success?
      data = response['data'][0]
      {
        temp: data['temp'],
        app_temp: data['app_temp']
      }
    else
      puts "Error: #{response.code} - #{response.message}"
      nil
    end
  end
end
