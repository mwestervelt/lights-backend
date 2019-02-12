class Api::V1::CountriesController < ApplicationController
skip_before_action :authorized, only: [:index]

  def index
    @data = Country.super_query
    render json: { countries: CountrySerializer.new(@data) }
  end

end
