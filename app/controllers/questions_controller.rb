class QuestionsController < ApplicationController
	def new
		@survey = Survey.find(params[:id])
	end

	def create
		question = Question.new(question_params)
		if question.save
			redirect_to "/questions/#{question.survey_id}"
		else
			flash[:errors] = question.errors.full_messages
			redirect_to "/questions/#{question.survey_id}"
		end
	end

	private
	def question_params
		params.require(:question).permit(:question_text, :survey_id)
	end
end
