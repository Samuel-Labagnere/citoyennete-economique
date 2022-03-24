class Evaluation < ApplicationRecord
    belongs_to :organisation

    validates_presence_of :annee
end
