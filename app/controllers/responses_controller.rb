class ResponsesController < ApplicationController
	def new
		@questions =  Survey.find(params[:survey_id]).question
		@respondent = Respondent.find(params[:respondent_id])
		@i = 0
	end

	def create
		flag = false
		fields = Array[:response1, :response2, :response3, :response4, :response5]
		for a in 0..4 do
			response = Response.new(params.require(fields[a]).permit(:response_text, :question_id, :respondent_id))
			if response.save
				flag = true
				
			else
				flash[:errors] = response.errors.full_messages
				redirect_to "/responses/#{response.respondent_id}/#{question.survey_id}"
			end
		end

		if flag == true
			redirect_to "/respondents"
		end
		
	end

	private
	def response_params
		params.require(:response).permit(:response_text, :question_id, :respondent_id)
	end
end
