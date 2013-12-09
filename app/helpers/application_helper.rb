module ApplicationHelper
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def is_active(path)
      "active" if params[:controller].include?(path) and 
      not current_page?('/')
  end

end
