class DeleteUserFields < ActiveRecord::Migration[5.0]
  def change
    change_table(:users) do |t|
      t.remove :title, :website, :copyright, :subtitle, :summary, :description, :username, :category, :explicit, :image_link
    end
  end
end
