class CountrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :average, :feeling_type
  # attribute :emotion do |country, params|
  #   country.avg_intensity_by_emotion(params[:emotion])
  # end
end
