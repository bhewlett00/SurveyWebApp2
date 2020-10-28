class Question < ApplicationRecord
	has_one :survey
	validates :question_text, presence: true
end
