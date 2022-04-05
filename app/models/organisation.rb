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
