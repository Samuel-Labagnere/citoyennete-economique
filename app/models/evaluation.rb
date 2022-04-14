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
class Evaluation < ApplicationRecord
  belongs_to :organisation
  has_one :state, dependent: :destroy

  accepts_nested_attributes_for :state

  validates_presence_of :annee, message: 'Le champ %{attribute} doit être rempli', if: :active_or_year?

  scope :active, -> { where(status: 'active') }
  scope :ordered, -> { order(annee: :desc) }

  after_commit :set_up_to_date

  def active?
    status == 'active'
  end

  def active_or_year?
    status == 'informations' || active?
  end

  def set_up_to_date
    organisation.evaluations.each do |evaluation|
      evaluation.state
                .update_column :up_to_date, false
    end
    if organisation.evaluations.active.present?
      organisation.evaluations
                  .active
                  .ordered
                  .first
                  .state
                  .update_column :up_to_date, true
    end
  end

  def to_s
    "Evaluation #{annee}"
  end
end
