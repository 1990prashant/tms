class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.integer :statable_id
      t.string :statable_type

      t.timestamps
    end
  end
end
