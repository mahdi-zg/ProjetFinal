class AddQuestiontwoToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_column :species, :questiontwo, :string
  end
end
