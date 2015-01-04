class TriggersController < ApplicationController

	def new
			
	end

	def create
		add = Trigger.new

		add.trigger = params[:trigger]
		add.action = params[:reaction]
		add.save

		redirect_to controls_url
	end

	def destroy
    @trigger = Trigger.find params[:id]
    @trigger.destroy
    redirect_to controls_url
  end

end
