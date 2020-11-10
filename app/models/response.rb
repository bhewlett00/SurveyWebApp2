class Response < ApplicationRecord
	belongs_to :question
	belongs_to :respondent
	has_one :question
	validates :response_text, presence: true
end
