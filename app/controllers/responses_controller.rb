class ResponsesController < ApplicationController
	def new
		@questions =  Survey.find(params[:survey_id]).question
		@respondent = Respondent.find(params[:respondent_id])
	end

	def create
		response = Response.new(response_params)
		if response.save
			redirect_to "respondents"
		else
			flash[:errors] = response.errors.full_messages
			redirect_to "/responses/#{response.respondent_id}/#{question.survey_id}"
		end
	end

	private
	def response_params
		params.require(:response).permit(:response_text, :survey_id, :respondent_id)
	end
end
