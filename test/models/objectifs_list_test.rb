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
require "test_helper"

class ObjectifsListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
