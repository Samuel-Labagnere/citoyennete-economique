class ObjectifsList < ApplicationRecord
  belongs_to :organisation
  has_one :indicateurs_list
end
