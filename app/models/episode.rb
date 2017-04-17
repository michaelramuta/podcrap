class Episode < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :title, :subtitle, :summary, :audio_link, :image_link, :length, :duration
  validate :duration_format, :length_format
  default_scope { order("created_at ASC") }

  def duration_format
    if duration !~ /\d:\d\d/
      errors.add(:duration, "Duration must be formatted as either HH:MM:SS, H:MM:SS, MM:SS, or M:SS")
    end
  end

  def length_format
    if length.to_i.to_s != length
      errors.add(:length, "Its gotta be a number buddy, I can't believe I'm writing validations for this")
    end
  end
end
