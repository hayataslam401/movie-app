class AddPositionToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :position, :integer
  end
end
