class Event < ApplicationRecord
  has_many :registrations
  has_many :members, through: :registrations, source: :user
  has_many :invitations
  has_many :activities, dependent: :destroy

  resourcify
end
