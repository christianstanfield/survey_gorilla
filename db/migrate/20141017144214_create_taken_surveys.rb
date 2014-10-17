class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.belongs_to :user
      t.belongs_to :created_survey

      t.timestamps
    end
  end
end
