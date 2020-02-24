class AddProjectIdInTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :project_id, :integer unless column_exists? :todos, :project_id
  end
end
