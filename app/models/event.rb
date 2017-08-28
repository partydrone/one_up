class Event < ApplicationRecord
  has_many :registrations
  has_many :users, through: :registrations
  has_many :invitations
  has_many :activities, dependent: :destroy

  resourcify
end
