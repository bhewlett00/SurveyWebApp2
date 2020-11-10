class RespondentsController < ApplicationController
	def index
		@surveys = Survey.all
		@respondents = Respondent.all
	end

	def new
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

	def show
		@surveys = Survey.all
		@respondent = Respondent.find(params[:id])
	end

	private
	def respondent_params
		params.require(:respondent).permit(:respondent_name)
	end

	private
	def response_params
		params.require(:response).permit(:response_text)
	end
end
