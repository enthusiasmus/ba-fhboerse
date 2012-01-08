# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Fhboerse::Application.initialize!

# for pagination at the index view
require 'will_paginate'
# for custom error messages at the new view
require 'custom_error_message'
# let paperclip know where it can find imagemagick
Paperclip.options[:command_path] = "/usr/local/bin/"