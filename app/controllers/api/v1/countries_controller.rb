class Api::V1::CountriesController < ApplicationController
  def index
    @countries = Country.all
    render json: { country: CountrySerializer.new(@countries, {params: {emotion: Emotion.first}}) }
  end

  def countries_happiness
    @happiness = Emotion.find(6)
    @countries = Country.all
    @average_happiness = @countries.avg_intensity_by_emotion(@happiness)
    render json: { country: CountrySerializer.new(@average_happiness) }
  end
end
