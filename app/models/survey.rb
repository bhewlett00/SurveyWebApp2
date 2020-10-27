class Survey < ApplicationRecord
	validates :survey_name, presence: true
end
