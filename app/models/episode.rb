class Episode < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :title, :subtitle, :summary, :audio_link, :image_link, :length, :duration
  default_scope { order("created_at ASC") }

  # before_save :validate_episode
end
