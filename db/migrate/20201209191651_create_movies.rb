class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.integer :runtime
      t.string :plot
      t.string :poster

      t.timestamps
    end
  end
end
