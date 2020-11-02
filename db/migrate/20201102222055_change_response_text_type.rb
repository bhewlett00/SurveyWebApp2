class ChangeResponseTextType < ActiveRecord::Migration[5.1]
  def change
  	change_column :responses, :response_text, :integer
  end
end
