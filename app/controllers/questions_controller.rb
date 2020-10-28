class QuestionsController < ApplicationController
	def new
	end

	def create
		question = Question.new(question_params)
		@survey = Question.find(params[:id])
		if question.save
			redirect_to "/surveys"
		else
			flash[:errors] = question.errors.full_messages
			redirect_to "/surveys/new"
		end
	end

	private
	def question_params
		params.require(:question).permit(:question_text, :survey_id)
	end
end
