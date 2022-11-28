class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.string :description
      t.integer :value
      t.integer :shares
      t.text :example
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
