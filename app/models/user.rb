class User < ApplicationRecord
  include Authentication
  include Authorization

  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations
  has_many :invitations, foreign_key: 'recipient_id'
  has_many :sent_invitations, class_name: 'Invitation', foreign_key: 'sender_id'

  validates :name, presence: true
end
