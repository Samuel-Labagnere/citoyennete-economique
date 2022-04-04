class Evaluation < ApplicationRecord
    belongs_to :organisation
    has_one :indicateurs_list

    accepts_nested_attributes_for :indicateurs_list
    validates_presence_of :annee
end
