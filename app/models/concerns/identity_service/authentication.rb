class IdentityService < ApplicationRecord
  module Authentication
    extend ActiveSupport::Concern

    included do
      belongs_to :user
    end

    module ClassMethods
      def create_with_omniauth(auth, user = nil)
        user ||= User.create_with_omniauth(auth['info'])
        create! do |identity_service|
          identity_service.user     = user
          identity_service.provider = auth['provider']
          identity_service.uid      = auth['uid']
        end
      end

      def find_with_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid'])
      end
    end
  end
end
