class Respondent < ApplicationRecord
	has_many :response
	validates :respondent_name, presence: true
end
