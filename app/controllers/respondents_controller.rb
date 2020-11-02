class RespondentsController < ApplicationController
	def index
		@surveys = Survey.all
	end

	def new
		@respondents = Respondent.all
	end

	def create
		respondent = Respondent.new(respondent_params)
		if respondent.save
			redirect_to "/respondents"
		else
			flash[:errors] = respondent.errors.full_messages
			redirect_to "/respondents/new"
		end
	end

	private
	def respondent_params
		params.require(:respondent).permit(:respondent_name)
	end
end
