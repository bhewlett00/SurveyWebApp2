class Question < ApplicationRecord
	has_one :survey
	has_many :reponse
	validates :question_text, presence: true
end
