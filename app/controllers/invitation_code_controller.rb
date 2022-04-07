class InvitationCodeController < ApplicationController
  before_action :authenticate_user!, only: %i[ index ]

  def index
    new_code = nil
    loop do
      new_code = SecureRandom.hex(3).upcase
      break unless InvitationCode.exists?(code: new_code)
    end

    InvitationCode.create(code: new_code, organisation_id: current_user.organisation.id, expires_at: Date.today + 2.days)

    @code = new_code
  end

  def join
    ic = InvitationCode.find_by(code: params[:code])
    if ic.nil?
      @message = I18n.t('notice.invitation.error')
    else
      current_user.organisation = ic.organisation
      current_user.save

      ic.destroy

      redirect_to user_root_path
    end
  end
end
