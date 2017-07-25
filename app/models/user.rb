class User < ApplicationRecord
  include Authentication
  include Authorization

  validates :first_name, :last_name, :email, presence: true

  def name
    [first_name, last_name].join(" ")
  end
end
