class IndicateursList < ApplicationRecord
  belongs_to :evaluation
  belongs_to :objectifs_list
end
