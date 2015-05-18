class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.string :body, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
  end
end
