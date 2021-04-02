class AddDetailsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :name
      t.string :breed
      t.string :sex
      t.string :color
      t.integer :age
      t.integer :weight
      t.text :bio
      t.integer :animal_id
    end
  end
end
