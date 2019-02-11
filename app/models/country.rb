class Country < ApplicationRecord
  has_many :users
  has_many :user_emotions, :through => :users
  has_many :emotions, :through => :user_emotions

  def avg_intensity_by_emotion(emotion)
    user_emotions = self.user_emotions.where(emotion_id: emotion.id)
    arr = user_emotions.map do |user_emotion|
      user_emotion.intensity
    end
    arr.inject(:+).to_f / arr.size
  end

end
