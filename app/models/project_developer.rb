class ProjectDeveloper < ApplicationRecord
  belongs_to :project
  belongs_to :developer, class_name: "User", foreign_key: :developer_id

  validate :creator

  private

    def creator
      !self.is_creator
    end

end
