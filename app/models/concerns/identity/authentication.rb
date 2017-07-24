class Identity < ApplicationRecord
  module Authentication
    extend ActiveSupport::Concern

    included do
      belongs_to :user
    end

    module ClassMethods
      def create_with_omniauth(auth)
        create(provider: auth['provider'], uid: auth['uid'])
      end

      def find_with_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid'])
      end
    end
  end
end
