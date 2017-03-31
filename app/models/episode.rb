class Episode < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :title, :subtitle, :summary, :audio_link, :image_link, :length, :duration

  # before_save :validate_episode
end
