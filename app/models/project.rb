class Project < ApplicationRecord
  
  has_many :project_developers
  has_many :developers, through: :project_developers
  has_many :todos
  has_many :states, as: :statable

  accepts_nested_attributes_for :todos

end
