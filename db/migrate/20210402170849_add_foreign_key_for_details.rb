class AddForeignKeyForDetails < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :details, :animals
  end
end
