class AddValueToTemplateValues < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :value, :decimal, :null=>false
  end
end
