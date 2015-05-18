class CreateCheers < ActiveRecord::Migration
  def change
    create_table :cheers do |t|
      t.references :goal, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
