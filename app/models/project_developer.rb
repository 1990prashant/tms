class ProjectDeveloper < ApplicationRecord
  belongs_to :project
  belongs_to :developer, class_name: "User", foreign_key: :developer_id

  before_destroy :skip_creator

  private

    def skip_creator
      self.is_creator == false
    end

end
