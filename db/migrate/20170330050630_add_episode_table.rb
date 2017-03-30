class AddEpisodeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.references :user
      t.string :title
      t.string :subtitle
      t.string :summary
      t.string :audio_link

      t.timestamps null: false
    end
  end
end
