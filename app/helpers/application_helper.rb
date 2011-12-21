module ApplicationHelper
  
  def controller_stylesheet
    controller_name = controller.controller_name
    if File.exists?( "#{Rails.root}/app/assets/stylesheets/#{controller_name}.css.scss" )
      stylesheet_link_tag( controller_name )
    end
  end
  
end
