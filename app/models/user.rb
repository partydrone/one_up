class User < ApplicationRecord
  include Authentication

  def name
    [first_name, last_name].join(" ")
  end
end
