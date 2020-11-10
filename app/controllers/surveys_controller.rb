class SurveysController < ApplicationController
	def index
		@surveys = Survey.all
	end

	def new
	end 

	def create
		survey = Survey.new(survey_params)
		if survey.save
			redirect_to "/surveys"
		else
			flash[:errors] = survey.errors.full_messages
			redirect_to "/surveys/new"
		end
	end

	def show
		@survey = Survey.find(params[:id])
		@questions = Survey.find(params[:id]).question
	end

	private
	def survey_params
		params.require(:survey).permit(:survey_name)
	end
end
