class User < ApplicationRecord
  include Authentication
  include Authorization

  has_many :registrations
  has_many :events, through: :registrations

  validates :first_name, :last_name, :email, presence: true

  def name
    [first_name, last_name].join(' ')
  end
end
