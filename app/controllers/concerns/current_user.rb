# frozen_string_literal: true

# Class to manage current or guest user
module CurrentUser
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: 'Guest guest',
                   first_name: 'Gg',
                   last_name: 'gG',
                   email: 'asd@asd'
    )
  end
end
