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

  def self.super_query
    Country.select('countries.id', 'countries.name', 'AVG(user_emotions.intensity) as "average"', 'emotions.feeling_type').joins(:users => { :user_emotions => :emotion }).order('countries.id').group('countries.id', 'countries.name', 'emotions.feeling_type')
  end

end
