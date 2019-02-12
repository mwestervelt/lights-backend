class Api::V1::UserEmotionsController < ApplicationController

  def create
    intensity = user_emotion_params[:intensity].to_i
    emotion_id = user_emotion_params[:emotion]
    @emotion = Emotion.find(emotion_id)
    @user_emotion = UserEmotion.create(user: @user, intensity: intensity, emotion: @emotion)
    if @user_emotion.valid?
      render json: { message: 'you got it dude'}, status: :created
    else
      render json: { error: 'failed to create your emotion' }, status: :not_acceptable
    end

  end

  private

  def user_emotion_params
    params.permit(:intensity, :emotion)
  end

end