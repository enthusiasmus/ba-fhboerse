module ApplicationHelper
  
  def controller_stylesheet
    controller_name = controller.controller_name
    if File.exists?( "#{Rails.root}/app/assets/stylesheets/#{controller_name}.css.scss" )
      stylesheet_link_tag( controller_name )
    end
  end
  
  def controller_javascript
    controller_name = controller.controller_name
    if File.exists?( "#{Rails.root}/app/assets/javascripts/#{controller_name}.js" )
      javascript_include_tag( controller_name )
    end
  end
  
  def is_active?(controller_name)
    "active" if params[:controller] == controller_name
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def provider
    case current_user.provider
      when "browser_id"
        "BrowserID"
      when "facebook"
        "Facebook"
      when "twitter"
        "Twitter"
    end
  end
end
