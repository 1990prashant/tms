class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :type
      t.integer :developer_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
