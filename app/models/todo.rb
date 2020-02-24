class Todo < ApplicationRecord

  belongs_to :project
  belongs_to :developer, class_name: "User", foreign_key: "developer_id", optional: true
  belongs_to :creator, class_name: "User", foreign_key: "creator_id", optional: true
  has_many :states, as: :statable
  enum status: { "Created": "created", "In Progress": "in_progress", "Completed": "completed" }

end
