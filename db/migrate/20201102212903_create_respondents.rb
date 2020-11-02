class CreateRespondents < ActiveRecord::Migration[5.1]
  def change
    create_table :respondents do |t|
      t.string :respondent_name

      t.timestamps
    end
  end
end
