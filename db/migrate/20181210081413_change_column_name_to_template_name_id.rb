class ChangeColumnNameToTemplateNameId < ActiveRecord::Migration[5.2]
  def change
    rename_column :temp_name_mids, :tempalte_name_id, :template_name_id

  end
end
