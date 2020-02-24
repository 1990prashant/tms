class State < ApplicationRecord

  belongs_to :statable, polymorphic: true
  
end
