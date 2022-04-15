# == Schema Information
#
# Table name: organisations
#
#  id                         :bigint           not null, primary key
#  agrement_specifique        :string
#  date_creation              :integer          not null
#  distinctions               :text
#  naf                        :string           not null
#  nom                        :string           not null
#  objectifs_extra_financiers :boolean
#  secteur_activite           :string           not null
#  siren                      :string           not null
#  statut_juridique           :integer          not null
#  valeurs_entreprise         :string
#  validation_admin           :boolean          default(FALSE)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_organisations_on_siren  (siren) UNIQUE
#
require "test_helper"

class OrganisationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
