class IdentityService < ApplicationRecord
  module Authentication
    extend ActiveSupport::Concern

    included do
      belongs_to :user
      around_destroy :destroy_orphaned_user
    end

    module ClassMethods
      def create_with_omniauth(auth, user = nil)
        user ||= User.create_with_omniauth(auth['info'])
        credentials = auth['credentials']
        create! do |identity_service|
          identity_service.user          = user

          identity_service.provider      = auth['provider']
          identity_service.uid           = auth['uid']

          identity_service.token         = credentials['token']
          identity_service.secret        = credentials['secret']
          identity_service.expires       = credentials['expires']
          identity_service.expires_at    = credentials['expires_at'].seconds.from_now
          identity_service.refresh_token = credentials['refresh_token']

          identity_service.auth          = auth.to_json
        end
      end

      def find_with_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid'])
      end
    end

    private

    def destroy_orphaned_user
      user = self.user
      yield
      if user.identity_services.length == 0
        user.destroy
      end
    end
  end
end
