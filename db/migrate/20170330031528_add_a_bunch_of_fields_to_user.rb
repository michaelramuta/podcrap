class AddABunchOfFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :title, :string
    add_column :users, :website, :string
    add_column :users, :copyright, :string
    add_column :users, :subtitle, :string
    add_column :users, :summary, :text
    add_column :users, :description, :text
    add_column :users, :username, :string
    add_column :users, :category, :string
    add_column :users, :explicit, :boolean
  end
end
