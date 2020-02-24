module Autherization
  extend ActiveSupport::Concern

  included do
    before_action :authorized
  end

  def authorized
    redirect_to root_url unless current_user.admin?
  end

end