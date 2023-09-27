# The WeatherController provides endpoints related to weather information.
# It relies on the WeatherbitClient to fetch the actual weather data from an external API,
# and then represents this data using the WeatherData model.
class WeatherController < ApplicationController
  # Fetches current weather data based on city and country parameters.
  # Converts the data retrieved from WeatherbitClient to a WeatherData object and renders it as JSON.
  #
  # @param city [String] the name of the city provided in the request parameters.
  # @param country [String] the two-letter country code provided in the request parameters.
  # @return [JSON] a JSON representation of the WeatherData.
  def current
    city = params[:city]
    country = params[:country]

    if city && country
      data = WeatherbitClient.get_temperature_data(city, country)

      # Convert the client's response to a WeatherData object.
      weather_data = WeatherData.new(
        temperature: data[:temp],
        apparent_temperature: data[:app_temp]
      )

      render json: weather_data.to_h, status: :ok
    else
      render json: { error: 'Parámetros city y country son requeridos.' }, status: :bad_request
    end
  end
end