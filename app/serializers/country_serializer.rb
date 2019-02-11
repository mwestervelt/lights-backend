class CountrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :abbreviation
  attribute :emotion do |country, params|
    country.avg_intensity_by_emotion(params[:emotion])
  end
end
