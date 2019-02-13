class Api::V1::EmotionsController < ApplicationController
skip_before_action :authorized, only: [:index]

  def index
    @emotions = Emotion.all
    render json: { emotions: EmotionSerializer.new(@emotions) }
  end
  
end
