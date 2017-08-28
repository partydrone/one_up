class Activity < ApplicationRecord
  belongs_to :event
  has_many :participations, dependent: :destroy
  has_many :activities, through: :participations
end
