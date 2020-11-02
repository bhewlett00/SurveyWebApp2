class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :response_text
      t.references :question, foreign_key: true
      t.references :respondent, foreign_key: true

      t.timestamps
    end
  end
end
