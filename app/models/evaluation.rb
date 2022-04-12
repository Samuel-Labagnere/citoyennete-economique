class Evaluation < ApplicationRecord
    belongs_to :organisation
    has_one :indicateurs_list, dependent: :destroy

    accepts_nested_attributes_for :indicateurs_list

    validates_presence_of :annee, message: "Le champ %{attribute} doit être rempli", if: :active_or_year?

    def active?
        status == 'active'
    end

    def active_or_year?
        status == 'informations' || active?
    end
end
