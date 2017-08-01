class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  store_accessor :systems, SYSTEMS.keys

  SYSTEMS.keys.each do |key|
    define_method key do
      super().to_i
    end

    define_method "#{key}=" do |value|
      super value.to_i
    end
  end
end
