class AddColumnToCreateUniquenessOfTemplate < ActiveRecord::Migration[5.2]
  def change
    add_index :templates, [:sample_id, :item_id], unique:true, name: :unique_coordinate_constraint
  end
end
