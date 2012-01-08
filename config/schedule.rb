# Use this file to easily define all of your cron jobs.
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever

set :output, "whenever.log"

#every 1.day, :at => '3:00 am' do
every 15.minute do
  runner "Jobs.remove_old_articles"
  runner "Items.remove_old_articles"
  runner "Apartments.remove_old_articles"
  runner "Drives.remove_old_articles"
  runner "Products.remove_old_articles"
end

