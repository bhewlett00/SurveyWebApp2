class Survey < ApplicationRecord
	has_many :question
	validates :survey_name, presence: true
end
