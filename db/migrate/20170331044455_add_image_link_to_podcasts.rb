class AddImageLinkToPodcasts < ActiveRecord::Migration[5.0]
  def change
    add_column :podcasts, :image_link, :string
  end
end
