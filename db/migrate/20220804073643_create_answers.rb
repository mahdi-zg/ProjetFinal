class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :specie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :label

      t.timestamps
    end
  end
end
