class AddTimestampsToTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :created_at, :datetime, :null => false
    add_column :templates, :updated_at, :datetime, :null => false
  end
end
