class CreateQuestionbank < ActiveRecord::Migration[5.2]
  def change
    create_table :questionbanks do |t|
    	t.string :questionbank_subject
    	t.string :questionbank_id
    	t.string :questionbank_question
    	t.string :questionbank_answer

    	t.timestamps
    end
  end
end
