class MainController < ApplicationController

	def controls
		@triggers = Trigger.all
	end

	helper_method :find_icon

	def find_icon(command)
		if command == "the humidity is higher than xx%" or command == "the humidity is lower than xx%" or command == "turn on the humidifier"
			return "humidifier.png"
		end
		if command == "turn on the air filter"
			return "air_filter.png"
		end
		if command == "motion is detected"
			return "motion.png"
		end
		if command == "turn on the light" or command == "turn off the light"
			return "light.png"
		end
	end

end
