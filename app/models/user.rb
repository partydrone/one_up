class User < ApplicationRecord
  include Authentication
  include Authorization

  has_many :registrations
  has_many :events, through: :registrations

  validates :name, presence: true
end
