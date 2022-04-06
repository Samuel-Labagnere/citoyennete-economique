class InvitationCodeController < ApplicationController
  def index
    new_code = nil
    loop do
      new_code = SecureRandom.hex(3).upcase
      break unless InvitationCode.exists?(code: new_code)
    end

    InvitationCode.create(code: new_code, organisation_id: current_user.organisation.id, expires_at: Date.today + 2.days)

    @code = new_code
  end
end
