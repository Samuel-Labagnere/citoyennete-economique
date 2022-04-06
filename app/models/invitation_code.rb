class InvitationCode < ApplicationRecord
  belongs_to :organisation

  default_scope { where(expires_at: Date.tomorrow..) }
end
