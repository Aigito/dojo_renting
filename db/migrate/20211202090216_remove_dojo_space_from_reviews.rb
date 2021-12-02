class RemoveDojoSpaceFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :dojo_space, null: false, foreign_key: true
  end
end
