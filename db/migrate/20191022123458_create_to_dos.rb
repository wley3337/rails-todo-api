class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.integer :list_id 
      t.string :title
      t.string :description, default: ""
      t.datetime :due
      t.timestamps
    end
  end
end
