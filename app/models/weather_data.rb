# The WeatherData class represents a simplified and customizable structure
# for weather information. It provides attributes for temperature, apparent temperature,
# and units of measurement.
#
# Example:
#   data = WeatherData.new(temperature: 22.5, apparent_temperature: 23.0)
#   data.to_h # => { temperature: 22.5, apparent_temperature: 23.0, units: 'Celsius' }
class WeatherData
  attr_accessor :temperature, :apparent_temperature, :units

  # Defines an enum for temperature units. The available options are Celsius, Fahrenheit, and Kelvin.
  UNITS = {
    celsius: 'Celsius',
    fahrenheit: 'Fahrenheit',
    kelvin: 'Kelvin'
  }.freeze

  # Initializes a new instance of WeatherData.
  #
  # @param temperature [Float] the actual temperature value.
  # @param apparent_temperature [Float] the apparent or "feels-like" temperature value.
  # @param units [String] the units of measurement for the temperature, defaulting to Celsius.
  def initialize(temperature:, apparent_temperature:, units: UNITS[:celsius])
    @temperature = temperature
    @apparent_temperature = apparent_temperature
    @units = units
  end

  # Converts the WeatherData object to a hash representation.
  #
  # @return [Hash] a hash representing the weather data.
  def to_h
    {
      temperature: @temperature,
      apparent_temperature: @apparent_temperature,
      units: @units
    }
  end
end
