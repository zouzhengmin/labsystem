class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :sample_id
      t.integer :item_id

      t.timestamps
    end
  end
end
