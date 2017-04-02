class AddPodcastMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :website
      t.string :copyright
      t.string :subtitle
      t.text :summary
      t.text :description
      t.string :username
      t.string :category
      t.boolean :explicit 

      t.timestamps null: false
    end
  end
end
