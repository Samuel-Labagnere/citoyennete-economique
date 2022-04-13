# == Schema Information
#
# Table name: evaluations
#
#  id                  :bigint           not null, primary key
#  annee               :integer
#  chiffre_affaires    :float
#  nombre_salaries     :integer
#  nombre_salaries_etp :integer
#  resultat_net        :float
#  status              :string           default("blank")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  organisation_id     :bigint
#
# Indexes
#
#  index_evaluations_on_organisation_id  (organisation_id)
#
require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
