# == Schema Information
#
# Table name: organisations
#
#  id                         :bigint           not null, primary key
#  agrement_specifique        :string
#  ape                        :string           not null
#  date_creation              :integer          not null
#  distinctions               :text
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
class Organisation < ApplicationRecord
    has_many :users
    has_many :evaluations
    has_one :objectifs_list

    enum statut_juridique: [ :EI, :EIRL, :EURL, :SARL, :SA, :SAS, :SASU, :SNC, :ScopSARL, :ScopSA, :ScopSAS, :SCA, :SCS ]
    validates_presence_of :nom, :statut_juridique, :date_creation, :secteur_activite, :ape, :siren

    def to_s
        "#{ nom }"
    end
end
