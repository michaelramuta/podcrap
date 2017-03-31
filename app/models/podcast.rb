class Podcast < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id, :title, :website, :copyright, :subtitle, :summary, :description, :username, :category, :image_link

  def configured?
    title.present? && website.present? && copyright.present? && subtitle.present? && summary.present? && description.present? && username.present? && category.present?
  end
end
