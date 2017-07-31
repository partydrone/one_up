class PagesController < ApplicationController
  skip_before_action :authenticate!
  skip_after_action :verify_authorized
end
