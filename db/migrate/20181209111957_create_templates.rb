class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.integer :sample_id
      t.integer :item_id
    end
  end
end
