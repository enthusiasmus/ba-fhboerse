# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Fhboerse::Application.initialize!

# will_paginate
require 'will_paginate'
require 'custom_error_message'
