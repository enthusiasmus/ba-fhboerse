# Use this file to easily define all of your cron jobs.
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever

set :output, "whenever.log"

every 1.day, :at => '3:00 am' do
  runner "Job.remove_old"
  runner "Item.remove_old"
  runner "Apartment.remove_old"
  runner "Drive.remove_old"
  runner "Product.remove_old"
end

