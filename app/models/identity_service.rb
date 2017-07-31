class IdentityService < ApplicationRecord
  include Authentication

  validates :provider, :uid, :user_id, presence: true
  validates :uid, uniqueness: { scope: :provider }
end
