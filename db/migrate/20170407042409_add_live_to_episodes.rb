class AddLiveToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :live, :boolean, :default => true
  end
end
