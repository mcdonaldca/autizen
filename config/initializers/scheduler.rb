# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#
# config/initializers/scheduler.rb
require 'rufus-scheduler'
require 'mail'

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'localhost',
            :user_name            => 'codingFTWatt',
            :password             => 'thisisntactuallyourpassword',
            :authentication       => 'plain',
            :enable_starttls_auto => true
          }

Mail.defaults do
  delivery_method :smtp, options
end

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton

# Awesome recurrent task...
#
s.every '30m' do
	#Mail.deliver do
	       #to 'codingFTWatt@gmail.com'
	     #from 'codingFTWatt@gmail.com'
	  #subject 'testing sendmail'
	     #body 'testing sendmail'
	#end
end



