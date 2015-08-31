module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-dismissable alert-info"
    when :success then "alert alert-dismissable alert-success"
    when :error then "alert alert-dismissable alert-danger"
    when :alert then "alert alert-dismissable alert-warning"
    end
  end

  def attribute_present_or_not?(attribute)
    if attribute.present?
      return "#{attribute}"
    else
      return " - "
    end
  end
end
