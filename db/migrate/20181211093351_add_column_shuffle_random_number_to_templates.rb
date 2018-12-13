class AddColumnShuffleRandomNumberToTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :random, :string
  end
end
