class MainController < ApplicationController

	def controls
		@triggers = Trigger.all
		new_trigger = Trigger.new
		new_trigger.save
	end

	class_attribute :testing

	def testing
		add = Trigger.new
		add.save
	end

end
