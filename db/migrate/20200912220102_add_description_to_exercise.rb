class AddDescriptionToExercise < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :workout, :string
  end
end
