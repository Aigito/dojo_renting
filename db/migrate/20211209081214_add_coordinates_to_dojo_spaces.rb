class AddCoordinatesToDojoSpaces < ActiveRecord::Migration[6.0]
  def change
    add_column :dojo_spaces, :latitude, :float
    add_column :dojo_spaces, :longitude, :float
  end
end
