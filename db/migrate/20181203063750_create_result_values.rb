class CreateResultValues < ActiveRecord::Migration[5.2]
  def change
    create_table :result_values do |t|
      t.decimal :value
      t.integer :result_id

      t.timestamps
    end
  end
end
