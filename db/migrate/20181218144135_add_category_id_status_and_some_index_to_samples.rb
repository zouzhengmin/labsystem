class AddCategoryIdStatusAndSomeIndexToSamples < ActiveRecord::Migration[5.2]
  def change
    add_column :samples, :category_id, :integer
    add_column :samples, :status, :string
    add_column :samples, :description, :text
    add_index :samples, [:category_id]
    add_index :samples, [:code], unique: true
    add_index :samples, [:name]
  end
end
