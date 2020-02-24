class CreateProjectDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_developers do |t|
      t.integer :project_id
      t.integer :developer_id
      t.boolean :is_creator, default: false

      t.timestamps
    end
  end
end
