class AddImageLengthAndDurationToEpisode < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :length, :string
    add_column :episodes, :duration, :string
    add_column :episodes, :image_link, :string
  end
end
