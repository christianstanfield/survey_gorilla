class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :choice
      t.belongs_to :taken_survey

      t.timestamps
    end
  end
end
