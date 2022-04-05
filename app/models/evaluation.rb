class Evaluation < ApplicationRecord
    belongs_to :organisation
    has_one :indicateurs_list, dependent: :destroy

    accepts_nested_attributes_for :indicateurs_list
    validates_presence_of :annee, message: "Le champ <strong>%{attribute}</strong> doit être rempli"
end
