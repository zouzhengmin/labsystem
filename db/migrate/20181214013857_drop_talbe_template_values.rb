class DropTalbeTemplateValues < ActiveRecord::Migration[5.2]
  def change
    drop_table :template_values
  end
end
