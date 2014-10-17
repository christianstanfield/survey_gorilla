class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.belongs_to :created_survey

      t.timestamps
    end
  end
end
