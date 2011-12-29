# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Fhboerse::Application.initialize!

# for pagination at the index view
require 'will_paginate'
# for custom error messages at the new view
require 'custom_error_message'

#Rails::Initializer.run do |config|
  # for ajax reloading with the gem will_paginate
  # config.gem "mislav-will_paginate", :lib => "will_paginate", :source => "http://gems.github.com"
#end