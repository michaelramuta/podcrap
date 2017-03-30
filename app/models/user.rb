class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :episodes

  def podcast_configured?
    title.present? && website.present? && copyright.present? && subtitle.present? && summary.present? && description.present? && username.present? && category.present?
  end
end
