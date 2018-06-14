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

  def bootstrap_class_for flash_type
    result = "alert "
    case flash_type.to_sym
      when :success
        result << "alert-success"
      when :error
        result << "alert-danger"
      when :alert
        result << "alert-warning"
      when :notice
        result << "alert-info"
      else
        result = flash_type
    end

    result
  end
  
end
