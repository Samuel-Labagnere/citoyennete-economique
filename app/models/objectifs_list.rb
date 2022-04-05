class ObjectifsList < ApplicationRecord
  belongs_to :organisation
  has_one :indicateurs_list, dependent: :destroy

  accepts_nested_attributes_for :indicateurs_list
end
