class CreateTempNameMids < ActiveRecord::Migration[5.2]
  def change
    create_table :temp_name_mids do |t|
      t.integer :template_id
      t.integer :tempalte_name_id

      t.timestamps :null => false
    end
  end
end
