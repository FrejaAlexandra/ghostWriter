class AddCategegoriesToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author_description, :string
    add_column :books, :psuedoname, :string
    remove_column :books, :category, :string
    add_column :users, :pronouns, :string
  end
end
