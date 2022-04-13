# == Schema Information
#
# Table name: objectifs_lists
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organisation_id :bigint
#
# Indexes
#
#  index_objectifs_lists_on_organisation_id  (organisation_id)
#
class ObjectifsList < ApplicationRecord
  belongs_to :organisation
  has_one :indicateurs_list, dependent: :destroy

  accepts_nested_attributes_for :indicateurs_list
end
