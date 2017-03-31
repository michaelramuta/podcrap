class Podcast < ApplicationRecord
  belongs_to :user

  def configured?
    title.present? && website.present? && copyright.present? && subtitle.present? && summary.present? && description.present? && username.present? && category.present?
  end
end
