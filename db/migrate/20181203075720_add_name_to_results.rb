class AddNameToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :name, :string
  end
end
