module ApplicationHelper
  
  def resource_name
    :user
  end

  # def course
  #   @course ||= Course.new
  # end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def is_active(path)
      "active" if current_page?(path)
  end

end
