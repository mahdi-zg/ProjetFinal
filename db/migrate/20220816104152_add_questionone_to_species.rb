class AddQuestiononeToSpecies < ActiveRecord::Migration[6.1]
  def change
    add_column :species, :questionone, :string
  end
end
