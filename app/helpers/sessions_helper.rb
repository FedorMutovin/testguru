module SessionsHelper
  def flash_message(type)
    content_tag :p, flash[type.to_s], class: "flash #{type}"
  end
end
