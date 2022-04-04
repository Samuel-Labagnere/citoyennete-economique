class IndicateursList < ApplicationRecord
  belongs_to :evaluation, optional: true
  belongs_to :objectifs_list, optional: true
end
