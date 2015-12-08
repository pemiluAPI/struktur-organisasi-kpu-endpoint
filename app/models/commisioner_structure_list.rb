class CommisionerStructureList < ActiveRecord::Base
  has_many :commisioner_structures, -> { select("id, position, name, parent_id") }
end
