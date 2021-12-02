class RemoveUserFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :user, null: false, foreign_key: true
  end
end
