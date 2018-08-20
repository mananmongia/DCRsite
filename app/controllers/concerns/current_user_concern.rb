module CurrentUserConcern
  extend ActiveSupport::Concern
  def current_user
    super || OpenStruct.new(name: 'User',first_name:'User',last_name:'Guest', email:'guest@muser.com')

  end
end