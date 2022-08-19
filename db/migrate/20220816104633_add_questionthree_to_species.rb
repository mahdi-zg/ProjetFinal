class AddQuestionthreeToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_column :species, :questionthree, :string
  end
end
