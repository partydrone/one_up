class User < ApplicationRecord
  module Authentication
    extend ActiveSupport::Concern

    included do
      has_many :identity_services
      has_secure_token :auth_token
    end

    module ClassMethods
      def create_with_omniauth(info)
        create! do |user|
          user.name       = info['name']
          user.email      = info['email']
          user.first_name = info['first_name']
          user.last_name  = info['last_name']
          user.image      = info['image']
        end
      end
    end
  end
end
