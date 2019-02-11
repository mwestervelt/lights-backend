class Api::V1::CountriesController < ApplicationController
  def index
    @data = Country.super_query
    render json: { countries: CountrySerializer.new(@data) }
  end

end
