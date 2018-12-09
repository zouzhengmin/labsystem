class CreateTemplateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :template_values do |t|
      t.decimal :value
      t.integer :template_id
    end
  end
end
