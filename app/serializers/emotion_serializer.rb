class EmotionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :feeling_type
end
