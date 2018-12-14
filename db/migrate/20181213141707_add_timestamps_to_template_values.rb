class AddTimestampsToTemplateValues < ActiveRecord::Migration[5.2]
  def change
    add_column :template_values, :created_at, :datetime, :null=>false
    add_column :template_values, :updated_at, :datetime, :null=>false
  end
end
