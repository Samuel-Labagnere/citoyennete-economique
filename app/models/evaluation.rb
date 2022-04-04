class Evaluation < ApplicationRecord
    belongs_to :organisation
    has_one :indicateurs_list

    validates_presence_of :annee
end
