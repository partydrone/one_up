class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :user

  store_accessor :systems, SYSTEMS.keys

  SYSTEMS.keys.each do |key|
    define_method "#{key}=".to_s do |value|
      if value == ''
        value = '0'
      end
      
      super value
    end
  end
end
