module ApplicationHelper

  def redirect_path
    return true if current_user.blank?
    path = if current_user.admin?
      projects_url
    else
      todos_url
    end
    path
  end

end
