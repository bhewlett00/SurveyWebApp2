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

	def show_responses
		@survey = Survey.find(params[:survey_id])
		@question = Question.find(params[:question_id])
		@responses = Response.where(question_id: params[:question_id])
	end

	def top_rated
		@survey = Survey.find(params[:id])
		@questions =  Survey.find(params[:id]).question
		top_rated_question_id = 0
		for i in 0..questions.length do
			greatest_response_sum = Response.where(question_id: questions[0]).sum(:response_text)
			response_sum = Response.where(question_id: questions[i]).sum(:response_text)
			if response_sum > greatest_response_sum
				greatest_response_sum = response_sum
				top_rated_question_id = i
			end
		end
		@top_rated_question = questions[top_rated_question_id]
	end

	def low_rated
	end

	private
	def survey_params
		params.require(:survey).permit(:survey_name)
	end
end
