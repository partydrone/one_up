class Activity < ApplicationRecord
  belongs_to :event
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user
end
