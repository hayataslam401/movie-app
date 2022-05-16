class AddGenreToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :genre, :integer, default: 0
  end
end
