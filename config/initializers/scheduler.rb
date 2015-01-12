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
s.every '1m' do
  response = Net::HTTP.get_response(URI("http://www.mailinator.com/feed?to=codingftwatt")).body
  data = Hash.from_xml(response).to_json
  item_info = JSON.parse(data)["RDF"]["item"]

  # such a janky solution.... #hackathonlyfe
  length = item_info.length
  count = 0

  item_info.each do |item|
    if count == length - 1
      @save = item
    end
    count += 1
  end

  title = @save["title"]
  Rails.logger.info title

  triggers = Trigger.all

  triggers.each do |trigger|
    update_rss = false
    if trigger.trigger == "humidity is lower than xx%" && title == "low humidity"
      update_rss = true
    end
    if trigger.trigger == "humidity is higher than xx%" && title == "high humidity"
      update_rss = true
    end
    if trigger.trigger == "motion is detected" && title == "motion occurred"
      update_rss = true
    end

    if update_rss
      message = rss_message(trigger.action)
      Mail.deliver do
           to 'codingftwatt@mailinator.com'
           from 'codingFTWatt@gmail.com'
           subject message
      end
    end
  end
end

def rss_message(action)
  if action == "turn on the humidifier"
    return "humidifier on"
  end
  if action == "turn off the humidifier"
    return "humidifier off"
  end
  if action == "turn on the light"
    return "light on"
  end
  if action == "turn off the light"
    return "light off"
  end
end