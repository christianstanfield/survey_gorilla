class CreateCreatedSurveys < ActiveRecord::Migration
  def change
    create_table :created_surveys do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end
  end
end
