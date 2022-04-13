# == Schema Information
#
# Table name: invitation_codes
#
#  id              :bigint           not null, primary key
#  code            :string
#  expires_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organisation_id :bigint           not null
#
# Indexes
#
#  index_invitation_codes_on_organisation_id  (organisation_id)
#
# Foreign Keys
#
#  fk_rails_...  (organisation_id => organisations.id)
#
require "test_helper"

class InvitationCodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
