class User < ApplicationRecord
  module Authentication
    extend ActiveSupport::Concern

    included do
      has_many :identities
      has_secure_token :auth_token
    end

    module ClassMethods
      def create_with_omniauth(info)
        create(
          first_name: info['first_name'],
          last_name:  info['last_name'],
          email:      info['email']
        )
      end
    end
  end
end
